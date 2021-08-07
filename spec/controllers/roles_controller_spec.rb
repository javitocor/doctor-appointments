require 'rails_helper'
require 'capybara/rspec'

RSpec.describe RolesController, type: :feature do
  context 'GET roles controller views' do
    let(:role1) { Role.create(id: 1, name: 'Doctor') }
    let(:role2) { Role.create(id: 2, name: 'Patient') }
    let(:role3) { Role.create(id: 3, name: 'Admin') }
    let(:user1) { User.create(id: 1, name: 'Peter', DOB: Date.new(2000, 9, 17), email: 'peter@example.com', password: 'password', role_id:role1.id) }
    let(:user2) { User.create(id: 1, name: 'Peter2', DOB: Date.new(2000, 9, 17), email: 'peter2@example.com', password: 'password', role_id:role2.id) }
    let(:user3) { User.create(id: 1, name: 'Peter3', DOB: Date.new(2000, 9, 17), email: 'peter3@example.com', password: 'password', role_id:role3.id) }
    let(:user4) { User.create(id: 1, name: 'Peter4', DOB: Date.new(2000, 9, 17), email: 'peter4@example.com', password: 'password', role_id:role2.id) }
    

    it 'Get #index' do
      visit new_user_session_path
      fill_in 'user_email', with: user3.email
      fill_in 'user_password', with: user3.password
      click_button 'Log in'
      visit roles_path
      expect(page).to have_content('Roles')
    end
    it 'Get #show doctor role' do
      visit new_user_session_path
      fill_in 'user_email', with: user3.email
      fill_in 'user_password', with: user3.password
      click_button 'Log in'
      visit role_path(role1)
      expect(page).to have_content(role1.name.to_s)
    end
    it 'Get #show patient role' do
      visit new_user_session_path
      fill_in 'user_email', with: user3.email
      fill_in 'user_password', with: user3.password
      click_button 'Log in'
      visit role_path(role2)
      expect(page).to have_content(role2.name.to_s)
    end
    it 'Cannot get #index as patient' do
      visit new_user_session_path
      fill_in 'user_email', with: user2.email
      fill_in 'user_password', with: user2.password
      click_button 'Log in'
      visit roles_path
      expect(page).to have_content('Appointments')
    end
    it 'Cannot get #index as doctor' do
      visit new_user_session_path
      fill_in 'user_email', with: user1.email
      fill_in 'user_password', with: user1.password
      click_button 'Log in'
      visit roles_path
      expect(page).to have_content('Appointments')
    end
    it 'Cannot get #show as patient' do
      visit new_user_session_path
      fill_in 'user_email', with: user2.email
      fill_in 'user_password', with: user2.password
      click_button 'Log in'
      visit role_path(role1)
      expect(page).to have_content('Appointments')
    end
    it 'Cannot get #show as doctor' do
      visit new_user_session_path
      fill_in 'user_email', with: user1.email
      fill_in 'user_password', with: user1.password
      click_button 'Log in'
      visit role_path(role1)
      expect(page).to have_content('Appointments')
    end
  end
end