require 'rails_helper'
require 'capybara/rspec'

RSpec.describe User, type: :model do
  context 'User associations tests' do
    it { should have_many(:doctor_user_appointments).class_name('Appointment').with_foreign_key('doctor_user_id') }
    it { should have_many(:patient_user_appointments).class_name('Appointment').with_foreign_key('patient_user_id') }
  end
  context 'Validations for users' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:DOB) }
    it { should validate_presence_of(:email) }
    it { should validate_length_of(:name).is_at_most(20).with_long_message('20 characters in user name is the maximum allowed.')  }
  end
  context 'Test user helper methods' do
    r1 = Role.create({ name: 'Doctor' })
    r2 = Role.create({ name: 'Patient'})
    r3 = Role.create({ name: 'Admin' })
    user1 = User.create(name: 'example', email: 'new@example.com', password:'password', password_confirmation:'password', DOB: Date.new(2000, 9, 17), role_id: 1)
    user2 = User.create(name: 'example2', email: 'new2@example.com', password:'password', password_confirmation:'password', DOB: Date.new(2000, 9, 17), role_id: 2)
    user3 = User.create(name: 'example3', email: 'new3@example.com', password:'password', password_confirmation:'password', DOB: Date.new(2000, 9, 17), role_id: 3)
    user4 = User.create(name: 'example4', email: 'new4@example.com', password:'password', password_confirmation:'password', DOB: Date.new(2000, 9, 17))
    it 'check if user is doctor' do
      expect(user1.doctor?).to eq (TRUE)
    end
    it 'check if user is patient' do
      expect(user2.patient?).to eq (TRUE)
    end
    it 'check if user is admin' do
      expect(user3.admin?).to eq (TRUE)
    end
    it 'check if assign role Patient by default' do
      user4.assign_role
      expect(user4.role.name).to eq ('Patient')
    end
  end
end