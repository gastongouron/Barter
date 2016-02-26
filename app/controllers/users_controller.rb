class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

 def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You have signed up successfully."
      redirect_to services_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @services = Service.where(serviceper_id:params[:id])
    # How to get timers for each service..
    @cooldown = []
    @services.each do |service|
      time = service.start
      timenow = DateTime.now
      @cooldown << (time - timenow)
    end
    p @cooldown
    @helps = Help.where(owner:current_user.id)

  end

  def update
    @user = User.find(params[:id])
    if @user.save
      flash[:notice] = "Profile has been updated."
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

private

  def user_params
    params.require(:user).permit( :name, :password, :email, :password_confirmation)
  end

end
