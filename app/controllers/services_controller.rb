class ServicesController < ApplicationController

before_action :require_signin!, only: [:show]
before_action :set_service, only: [:show, :edit, :update, :destroy]

  def index
    @activeservices = Service.where(archived: false).order('created_at DESC')
    @archivedservices = Service.where(archived: true).order('created_at DESC')

  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    @service.end = @service.start + 1*60*60
    if current_user
      @service.servicer_id = current_user.id
      @servicecreator = User.find_by(id: @service.servicer_id)
      @service.servicer_name = @servicecreator.name
    end

    if @service.save
     current_user.timecoin -= 1
     current_user.save
      flash[:notice] = "Service has been created."
      redirect_to @service
    else
      flash.now[:alert] = "Service has not been created."
      render "new"
    end
  end

  def show
    @service = Service.find_by(id: params[:id])
    p @servicer = User.find_by(id: @service.servicer_id)
    a = Geocoder.search(@service.location)
    ll = a[0].data["geometry"]["location"]
    @lat = ll['lat']
    @lng = ll['lng']
    @time = @service.start
    @timenow = DateTime.now
    @cooldown = @time - @timenow
  end

  def edit
  end

  def update
    @service.update(service_params)
    a = Geocoder.search(@service.location)
    ll = a[0].data["geometry"]["location"]
    @lat = ll['lat']
    @lng = ll['lng']
    @time = @service.start
    @timenow = DateTime.now
    @cooldown = @time - @timenow
    @pick = Help.find_by(owner:params["service"]["owner"])
    @helper = User.find_by(id:params["service"]["helper_id"])
    @helper.save if @helper

      @service.helps.each do |help|
        help.chosen = false
        help.save
      end

      # change this weird logic ASAP
      if @pick
        if @pick.chosen == false
          @pick.chosen = true
          @service.help_id = @pick.id
          @helper.save
          @pick.save
          @service.save
          flash.now[:alert] = "You selected a helper for this service."
        elsif @pick.chosen == true
          @pick.chosen = false
          @helper.timecoin -= 1
          @service.help_id = nil
          @service.helper_id = nil
          @helper.save
          @pick.save
          @service.save
          flash.now[:alert] = "You unselected this Helper."
        end
      end
    flash.now[:alert] = "Service has been updated."
    redirect_to [@service, @help]
  end

  def destroy
    @service.destroy
    current_user.timecoin += 1
    current_user.save
    flash[:notice] = "Service has been deleted. You just got your token back."
    redirect_to services_path
  end

private

  def service_params
    params.require(:service).permit(
      :name,
      :description,
      :location,
      :start,
      :end,
      :helper_id,
      :servicer_id,
      :help_id,
      :archived,
      :credited,
      :strengh,
      :place,
      :geography,
      :difficulty
    )
  end

  def set_service
    @service = if current_user.admin? || current_user
      Service.find(params[:id])
    else
      Service.viewable_by(current_user).find(params[:id])
    end
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The service you were looking for could not be found."
    redirect_to services_path
  end

end
