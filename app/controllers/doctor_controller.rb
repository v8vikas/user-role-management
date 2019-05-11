class DoctorController < ApplicationController
before_action :authenticate_user!
before_action :authorize
def index
  @users = User.where(role: "patient")
end
def authorize
  if current_user.patient?
    flash[:alert] = "Unauthorized page"
    redirect_to patient_index_path
  elsif current_user.admin?
    flash[:alert] = "Unauthorized page"
    redirect_to admin_index_path
  end
end
end
