class Role < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20, too_long: '20 characters in role name is the maximum allowed.'  }
  has_many :users, dependent: :restrict_with_exception
end
