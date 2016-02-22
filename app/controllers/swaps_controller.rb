class SwapsController < ApplicationController

#before_action :authorize_admin!, except: [:index, :show]
#before_action :authorize_rich!, except: [:index, :show, :update]
before_action :require_signin!, only: [:show]
before_action :set_swap, only: [:show, :edit, :update, :destroy]

  def index
    @swaps = Swap.all.order('created_at DESC')
  end

  def new
    @swap = Swap.new
  end

  def create
    @swap = Swap.new(swap_params)

    if current_user
      @swap.swapper_id = current_user.id
      @swapcreator = User.find_by(id: @swap.swapper_id)
      @swap.swapper_name = @swapcreator.name
    end

    if @swap.save
      current_user.timecoin -= 1
      current_user.save
      flash[:notice] = "Swap has been created."
      redirect_to @swap
    else
      flash.now[:alert] = "Swap has not been created."
      render "new"
    end
  end

  def show
    p "--------------------------------"
     a = Geocoder.search(@swap.location)
    ll = a[0].data["geometry"]["location"]
    @lat = ll['lat']
    @lng = ll['lng']
    @time = @swap.start
    @timenow = DateTime.now
    @cooldown = @time - @timenow
  end

  def edit
  end

  def update
    @swap.update(swap_params)
    a = Geocoder.search(@swap.location)
    ll = a[0].data["geometry"]["location"]
    @lat = ll['lat']
    @lng = ll['lng']
    @time = @swap.start
    @timenow = DateTime.now
    @cooldown = @time - @timenow
    @pick = Bart.find_by(owner:params["swap"]["owner"])
    @barter = User.find_by(id:params["swap"]["barter_id"])
    @barter.save if @barter

      @swap.barts.each do |bart|
        bart.chosen = false
        bart.save
      end

      if @pick
        if @pick.chosen == false
          #@barter.timecoin += 1
          @pick.chosen = true
          @swap.bart_id = @pick.id
          @pick.save
          @swap.save
          flash.now[:alert] = "You selected a barter for this swap."
        elsif @pick.chosen == true
          @pick.chosen = false
          @swap.bart_id = nil
          @swap.barter_id = nil
          @pick.save
          @swap.save
          flash.now[:alert] = "You unselected this Barter."
        end
        redirect_to [@swap, @bart]
      end

  end

  def destroy
    @swap.destroy
    flash[:notice] = "Swap has been deleted."
    redirect_to swaps_path
  end

private

  def swap_params
    params.require(:swap).permit(
      :name,
      :description,
      :location,
      :start,
      :end,
      :barter_id,
      :swapper_id,
      :bart_id
    )
  end

  def set_swap
    @swap = if current_user.admin? || current_user
      Swap.find(params[:id])
    else
      Swap.viewable_by(current_user).find(params[:id])
    end
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The swap you were looking for could not be found."
    redirect_to swaps_path
  end

  def mustberich
    if current_user.timecoin < 1
      flash[:alert] = "You must have a timecoin to do that."
      redirect_to root_path
    end
  end

  # def belongstoswap(swap)
  #   swap.barts.each do |bart|
  #     bart.chosen.any? {|chosen| chosen == true }
  #   end
  # end

end
