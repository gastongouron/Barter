class HelpsController < ApplicationController

before_action :set_service
before_action :set_help, only: [:show, :edit, :update, :destroy]
before_action :require_signin!, except: [:show, :index]

  def new
    @help = @service.helps.build
  end

  def create
    @help = @service.helps.build(help_params)
    @help.owner = current_user.id
    @help.user = current_user
    if @help.save
      flash[:notice] = "Help has been created."
      redirect_to [@service]
    else
      flash.now[:alert] = "Help has not been created. You can only create one Help per Service"
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @help.update(help_params)
      flash[:notice] = "Help has been updated."
      redirect_to [@service, @help]
    else
      flash[:alert] = "Help has not been updated."
      render action: "edit"
    end
  end

  def destroy
    @help.destroy
    flash[:notice] = "Help has been deleted."
    redirect_to @service
  end

private

  def help_params
    params.require(:help).permit(:name, :description, :owner)
  end

  def set_help
    @help = @service.helps.find(params[:id])
  end

  def set_service
    @service = Service.find(params[:service_id])
  end

end
