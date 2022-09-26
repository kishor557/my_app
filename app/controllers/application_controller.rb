class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:index]
  
  
  def after_sign_in_path_for(resource)
    if user_signed_in?
      features_path
    else
      new_user_session_path   # login page
    end
  end
end
