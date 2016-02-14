class SwapsController < ApplicationController

  def index
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

  def update
  end

private

  def swap_params
    params.require(:swap).permit(:name,
                                 :description,
                                 :location,
                                 :start,
                                 :end,
                                 :swapper_id,
                                 :barter_id)
  end

end
