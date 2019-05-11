class AdminController < ApplicationController
before_action :authenticate_user!
before_action :authorize
def index
  @users = User.where.not(role: "admin")
end
def authorize
  if current_user.patient?
    flash[:alert] = "Unauthorized page"
    redirect_to patient_index_path
  elsif current_user.doctor?
    flash[:alert] = "Unauthorized page"
    redirect_to doctor_index_path
  end
end
end
