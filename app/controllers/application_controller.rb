class ApplicationController < ActionController::Base
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:user_name,:gender_id,:age_id,:profile,:image])
    devise_parameter_sanitizer.permit(:account_update, keys:[:nickname,:user_name,:gender_id,:age_id,:profile,:image])
  end  
end
