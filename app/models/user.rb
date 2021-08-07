class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :role, optional: true
  has_many :appointments, dependent: :destroy
  validates :name, :DOB, presence: true
  has_many :doctor_user_appointments, class_name: 'Appointment', foreign_key: 'doctor_user_id', dependent: :destroy
  has_many :patient_user_appointments, class_name: 'Appointment', foreign_key: 'patient_user_id', dependent: :destroy
  
  before_save :assign_role
  def self.search(search)  
    where("lower(users.name) LIKE :search AND  users.role_id LIKE 1", search: "%#{search.downcase}%") 
  end
    
  def admin?
    role.name == 'Admin'
  end

  def doctor?
    role.name == 'Doctor'
  end
  
  def patient?
    role.name == 'Patient'
  end
  
  def assign_role
    self.role = Role.find_by name: 'Patient' if role.nil?
  end
end
