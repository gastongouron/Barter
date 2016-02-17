class SwapsController < ApplicationController

before_action :authorize_admin!, except: [:index, :show]
#before_action :mustberich, except: [:index, :show, :update]
before_action :set_swap, only: [:show, :edit, :update, :destroy]

  def index
    @swaps = Swap.all
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
  end

  def edit
  end

  def update
    @swap.update(swap_params)
    flash[:notice] = "Swap has been updated."
    if current_user.timecoin > 1 && @swap.barter_id == nil
      p "----------------------------------"
      @barter = User.find_by(id:params["swap"]["barter_id"])
      @barter.timecoin += 1
      @barter.save
      current_user.timecoin -= 1
      current_user.save
    else
    flash.now[:alert] = "You need a timecoin to select a barter."
    redirect_to @swap
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
      :swapper_id
    )
  end

  def set_swap
    @swap = Swap.find(params[:id])
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

end
