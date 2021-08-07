require 'rails_helper'
require 'capybara/rspec'

RSpec.describe SearchesController, type: :feature do
  context 'Testing search bar' do
    let(:role1) { Role.create(id: 1, name: 'Doctor') }
    let(:role2) { Role.create(id: 2, name: 'Patient') }
    let(:role3) { Role.create(id: 3, name: 'Admin') }
    let(:user1) { User.create(id: 1, name: 'Peter', DOB: Date.new(2000, 9, 17), email: 'peter@example.com', password: 'password', role_id:role1.id) }
    let(:user2) { User.create(id: 2, name: 'Peter2', DOB: Date.new(2000, 9, 17), email: 'peter2@example.com', password: 'password', role_id:role1.id) }
    let(:user3) { User.create(id: 3, name: 'Peter3', DOB: Date.new(2000, 9, 17), email: 'peter3@example.com', password: 'password', role_id:role1.id) }
    let(:user4) { User.create(id: 4, name: 'Peter4', DOB: Date.new(2000, 9, 17), email: 'peter4@example.com', password: 'password', role_id:role2.id) }
    before :each do
      visit new_user_session_path
      fill_in 'user_email', with: user4.email
      fill_in 'user_password', with: user4.password
      click_button 'Log in'
      visit users_path
    end
    scenario 'Testing search bar' do
      fill_in 'search', with: 'example'
      click_button 'Search'
      sleep(2)
      expect(page).to have_content('peter')
    end
  end
end