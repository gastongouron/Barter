class SwapsController < ApplicationController

  def index
  end

  def new
    @swap = Swap.new
  end

  def create
    @swap = Swap.new(swap_params)
    if @swap.save
      flash[:notice] = "Project has been created."
      redirect_to @swap
    else
    # nothing, yet
    end
  end

  def show
    @swap = Swap.find(params[:id])
  end

private

  def swap_params
    params.require(:swap).permit(:name, :description)
  end

end
