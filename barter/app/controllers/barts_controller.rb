class BartsController < ApplicationController

before_action :set_swap
before_action :set_bart, only: [:show, :edit, :update, :destroy]

  def new
    @bart = @swap.barts.build
  end

  def create
    @bart = @swap.barts.build(bart_params)
    if @bart.save
      flash[:notice] = "Bart has been created."
      redirect_to [@swap, @bart]
    else
      flash.now[:alert] = "Bart has not been created."
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @bart.update(bart_params)
      flash[:notice] = "Bart has been updated."
      redirect_to [@swap, @bart]
    else
      flash[:alert] = "Bart has not been updated."
      render action: "edit"
    end
  end

private

  def bart_params
    params.require(:bart).permit(:name, :description)
  end

  def set_bart
    @bart = @swap.barts.find(params[:id])
  end

  def set_swap
    @swap = Swap.find(params[:swap_id])
  end

end
