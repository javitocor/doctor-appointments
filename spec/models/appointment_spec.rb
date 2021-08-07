require 'rails_helper'
require 'capybara/rspec'

RSpec.describe Appointment, type: :model do
  context 'Appointments associations tests' do
    it { should belong_to(:doctor_user).class_name('User') }
    it { should belong_to(:patient_user).class_name('User')  }
  end
  context 'Validations for appointments' do
    it { should validate_presence_of(:subject) }
    it { should validate_presence_of(:start_at) }
    it { should validate_presence_of(:end_at) }
    it { should validate_length_of(:subject).is_at_most(50).with_long_message('50 characters in subject is the maximum allowed.') }
  end
  context 'Validates appointment' do
    #user1 = User.create(name: 'example', email: 'examplee@example.com', password:'password', password_confirmation:'password', DOB: Date.new(2000, 9, 17), role_id: 1)
    #user2 = User.create(name: 'example2', email: 'examplee2@example.com', password:'password', password_confirmation:'password', DOB: Date.new(2000, 9, 17), role_id: 2)
    #app1 = Appointment.create(subject: 'anual checking', start_at: Time.zone.now, end_at: Time.zone.now + 2.hours, doctor_user_id: user1.id, patient_user_id:user2.id)
    #app2 = Appointment.create(subject: 'anual checking', start_at: Time.zone.now, end_at: Time.zone.now + 2.hours, doctor_user_id: user2.id, patient_user_id:user1.id)

  end
end