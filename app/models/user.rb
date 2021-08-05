class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :role, optional: true
  validates :name, :DOB, presence: true

  before_save :assign_role

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
    self.role = Role.find_by name: 'Regular' if role.nil?
  end
end
