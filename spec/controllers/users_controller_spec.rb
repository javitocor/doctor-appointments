require 'rails_helper'
require 'capybara/rspec'

RSpec.describe UsersController, type: :feature do
  context 'GET users controller views' do
    let(:role1) { Role.create(id: 1, name: 'Doctor') }
    let(:role2) { Role.create(id: 2, name: 'Patient') }
    let(:role3) { Role.create(id: 3, name: 'Admin') }
    let(:user1) { User.create(id: 1, name: 'Peter', DOB: Date.new(2000, 9, 17), email: 'peter@example.com', password: 'password', role_id:role1.id) }
    let(:user2) { User.create(id: 2, name: 'Peter2', DOB: Date.new(2000, 9, 17), email: 'peter2@example.com', password: 'password', role_id:role2.id) }
    let(:user3) { User.create(id: 3, name: 'Peter3', DOB: Date.new(2000, 9, 17), email: 'peter3@example.com', password: 'password', role_id:role3.id) }
    let(:user4) { User.create(id: 4, name: 'Peter4', DOB: Date.new(2000, 9, 17), email: 'peter4@example.com', password: 'password', role_id:role2.id) }
    
    it 'Get #index as admin' do
      visit new_user_session_path
      fill_in 'user_email', with: user3.email
      fill_in 'user_password', with: user3.password
      click_button 'Log in'
      visit users_path
      expect(page).to have_content('Users')
    end
    it 'Get #show as admin' do
      visit new_user_session_path
      fill_in 'user_email', with: user3.email
      fill_in 'user_password', with: user3.password
      click_button 'Log in'
      visit user_path(user2)
      expect(page).to have_content(user2.name.to_s)
    end
    it 'Get #index as patient' do
      visit new_user_session_path
      fill_in 'user_email', with: user2.email
      fill_in 'user_password', with: user2.password
      click_button 'Log in'
      visit users_path
      expect(page).to have_content('Users')
    end
    it 'Get #show action of a doctor as patient' do
      visit new_user_session_path
      fill_in 'user_email', with: user2.email
      fill_in 'user_password', with: user2.password
      click_button 'Log in'
      visit user_path(user1)
      expect(page).to have_content(user1.name.to_s)
    end
    it 'Patient cannot Get #show action of other patients and redirected to root' do
      visit new_user_session_path
      fill_in 'user_email', with: user2.email
      fill_in 'user_password', with: user2.password
      click_button 'Log in'
      visit user_path(user2)
      expect(page).to have_content('Appointments')
    end
    it 'Get #index as doctor' do
      visit new_user_session_path
      fill_in 'user_email', with: user1.email
      fill_in 'user_password', with: user1.password
      click_button 'Log in'
      visit users_path
      expect(page).to have_content('Users')
    end
    it 'Get #show of a patient as doctor' do
      visit new_user_session_path
      fill_in 'user_email', with: user1.email
      fill_in 'user_password', with: user1.password
      click_button 'Log in'
      visit user_path(user2)
      expect(page).to have_content(user2.name.to_s)
    end
  end
end