class Appointment < ApplicationRecord
  belongs_to :doctor_user, class_name: 'User'
  belongs_to :patient_user, class_name: 'User'
end
