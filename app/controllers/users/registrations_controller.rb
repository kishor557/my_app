
# Overriding the Devise RegistrationsController
class Users::RegistrationsController < Devise::RegistrationsController
  before_action :sign_up_params, only: [:create]
  before_action :account_update_params, only: [:update]

  def new
    puts "\n\n...Im in ur local...\n\n"
    build_resource({})
    resource.build_profile
    respond_with self.resource
  end

  def create
    super
  end
  
  def update
    super
  end
  
  private

  # This one for sign_up
  def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up)
    params.require(:user).permit(:email, :password, :password_confirmation, profile_attributes: [:id, :full_name, :phone, :address, :pin_code, :picture])
  end

  # this one for Edit registeration
  def account_update_params
    params.require(:user).permit(:current_password, :email, :password, :password_confirmation, profile_attributes: [:id, :full_name, :phone, :address, :pin_code, :picture])
  end  
end 
