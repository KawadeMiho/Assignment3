class ApplicationController < ActionController::Base
before_action :authenticate_user!, except: [:top, :about]
before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
   user_path(resource)
  end

  def after_sign_out_path_for(resource)
   root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

  def edit
  @user = User.find(params[:id])
  end

  def update
  @user = User.find(params[:id])
  @user.update(user_params)
  redirect_to user_path(@user.id)
  end

end
