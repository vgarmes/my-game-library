class RegistrationsController < Devise::RegistrationsController
  
  # only admin can create new users:
  before_action :authenticate_user!, :redirect_unless_admin, only: [:new, :create]
  # when admin tries to sign up a new user, Devise will throw the error "User already logged in", to avoid it:
  skip_before_action :require_no_authentication

  private
  def redirect_unless_admin
    unless current_user.try(:admin?)
      flash[:error] = "Only admins can do that"
      redirect_to root_path
    end
  end

  # override sign_up method to prevent automatic signup 
  # (otherwise newly created user will be automatically signed in)
  def sign_up(resource_name, resource)
    true
  end

  def sign_up_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :current_password)
  end

end