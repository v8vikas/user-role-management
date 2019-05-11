class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end
   def after_sign_in_path_for(resource)
    if resource.role == "doctor"
    doctor_index_path
  elsif resource.role == "patient"
    patient_index_path
  elsif resource.role == "admin"
    admin_index_path
  end

    # return the path based on resource
  end
  rescue_from CanCan::AccessDenied do |exception|
  redirect_to root_url, alert: exception.message
end
  # def after_sign_out_path_for(resource)
  #   # return the path based on resource
  # end
end
