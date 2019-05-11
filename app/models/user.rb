class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum roles: { Admin: "admin" , Doctor: "doctor", Patient: "patient" }

  def admin?
    role == "admin"
  end

  def doctor?
    role == "doctor"
  end

  def patient?
    role == "patient"
  end
end
