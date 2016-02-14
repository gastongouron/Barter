class SwapsController < ApplicationController

  def index
    @swaps = Swap.all
  end

  def new
    @swap = Swap.new
  end

  def create
    @swap = Swap.new(swap_params)
    if @swap.save
      flash[:notice] = "Swap has been created."
      redirect_to @swap
    else
      flash.now[:alert] = "Swap has not been created."
      render "new"
    end
  end

  def show
    @swap = Swap.find(params[:id])
  end

  def edit
    @swap = Swap.find(params[:id])
  end

  def update
    @swap = Swap.find(params[:id])
    @swap.update(swap_params)
    flash[:notice] = "Swap has been updated."
    redirect_to @swap
  end

  def destroy
    @swap = Swap.find(params[:id])
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

end
