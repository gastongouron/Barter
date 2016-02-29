class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

 def create
  p params
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
<<<<<<< HEAD
    @active_services = Service.where(servicer_id:params[:id], archived: false)
    @archived_services = Service.where(servicer_id:params[:id], archived: true)

=======
    @services = Service.where(servicer_id:params[:id])
>>>>>>> c1aeb08e5e3eb260c73297b43acfd1a6456a88ed
    @cooldown = []
    @active_services.each do |service|
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
      redirect_to user_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

private

  def user_params
    params.require(:user).permit( :name, :password, :email, :password_confirmation, :avatar)
  end

end
