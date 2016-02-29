class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password) }
        devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :date_of_birth, :avatar) }
    end

  private

  def require_signin!
    if current_user.nil?
      flash[:error] =
      "You need to sign in or sign up before continuing."
      redirect_to signin_url
    end
  end

  def authorize_admin!
    require_signin!
    unless current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to root_path
    end
  end

  helper_method :require_signin!

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

  helper_method :current_user


end

