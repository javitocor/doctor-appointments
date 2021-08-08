class Appointment < ApplicationRecord
  validates :subject, presence: true, length: { maximum: 50, too_long: '50 characters in subject is the maximum allowed.'  }
  validates :start_at, presence: true, :on => :create
  validates :end_at, presence: true
  validate :valid_date
  belongs_to :doctor_user, -> {where("role_id = ?", 1)}, class_name: 'User'
  belongs_to :patient_user, -> {where("role_id = ?", 2)}, class_name: 'User'

  mount_uploaders :user_image, UserImageUploader
  serialize :user_image


  def valid_date
    errors.add(:start_at, "Can't book in the past") if start_at.present? && start_at < Date.current
  end
end
