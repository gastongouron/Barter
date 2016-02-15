class BartsController < ApplicationController


before_action :set_swap
before_action :set_bart, only: [:show, :edit, :update, :destroy]
before_action :require_signin!, except: [:show, :index]

  def new
    @bart = @swap.barts.build
  end

  def create
    @bart = @swap.barts.build(bart_params)
    @bart.user = current_user
    if @bart.save
      flash[:notice] = "Bart has been created."
      redirect_to [@swap]
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

  def destroy
    @bart.destroy
    flash[:notice] = "Bart has been deleted."
    redirect_to @swap
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
