class SwapsController < ApplicationController

before_action :set_swap, only: [:show, :edit, :update, :destroy]

  def index
    @swaps = Swap.all
  end

  def new
    @swap = Swap.new
  end

  def create
    @swap = Swap.new(swap_params)
    @swap.swapper_id = current_user.id
    if @swap.save
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
    redirect_to @swap
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
      :swapper_id,
      :barter_id
    )
  end

  def set_swap
    @swap = Swap.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The swap you were looking for could not be found."
    redirect_to swaps_path
  end


end
