class PatientController < ApplicationController
before_action :authenticate_user!
before_action :authorize
def index
end
def authorize
  if current_user.admin?
    flash[:alert] = "Unauthorized page"
    redirect_to admin_index_path
  elsif current_user.doctor?
    flash[:alert] = "Unauthorized page"
    redirect_to doctor_index_path
  end
end
end
