class Appointment < ApplicationRecord
  belongs_to :doctor_user, -> {where("role_id = ?", 1)}, class_name: 'User'
  belongs_to :patient_user, -> {where("role_id = ?", 2)}, class_name: 'User'

  mount_uploaders :user_image, UserImageUploader
  serialize :user_image
end
