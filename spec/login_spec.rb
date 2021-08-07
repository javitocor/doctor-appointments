require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Login and signup features', type: :feature do
  context 'login and logout' do
    let(:role) { Role.create(id: 1, name: 'Patient') }
    let(:user) { User.create(id: 1, name: 'Peter', DOB: Date.new(2000, 9, 17), email: 'peter@example.com', password: 'password', role_id:role.id) }
    scenario 'login' do
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Log in'
      expect(page).to have_content('Signed in successfully')
    end
    scenario 'logout after login' do
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Log in'
      click_link 'Sign out'
      expect(page).to have_content('sign in')
    end
    scenario 'validating email' do
      visit new_user_session_path
      fill_in 'user_email', with: 'thing@.com'
      fill_in 'user_password', with: user.password
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end
    scenario 'validating password' do
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: '56454'
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end
  end
  context 'signup' do
    scenario 'signup' do
      visit new_user_registration_path
      fill_in 'user_name', with: 'Peter'
      fill_in 'user_DOB', with: Time.zone.now
      fill_in 'user_email', with: 'peter@example.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      click_button 'Sign up'
      expect(page).to have_content('Appointments')
    end
    scenario 'fail signup' do
      visit new_user_registration_path
      click_button 'Sign up'
      expect(page).to have_content('errors prohibited this user from being saved')
    end
    scenario 'name validation' do
      visit new_user_registration_path
      fill_in 'user_email', with: 'peter@example.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      click_button 'Sign up'
      expect(page).to have_content("Name can't be blank")
    end
    scenario 'DOB validation' do
      visit new_user_registration_path
      fill_in 'user_name', with: 'Peter'
      fill_in 'user_email', with: 'peter@example.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      click_button 'Sign up'
      expect(page).to have_content("Dob can't be blank")
    end
    scenario 'email validation' do
      visit new_user_registration_path
      fill_in 'user_name', with: 'Peter'
      fill_in 'user_DOB', with: Date.new(2000, 9, 17)
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      click_button 'Sign up'
      expect(page).to have_content("Email can't be blank")
    end
    scenario 'password validation' do
      visit new_user_registration_path
      fill_in 'user_name', with: 'Peter'
      fill_in 'user_DOB', with: Date.new(2000, 9, 17)
      fill_in 'user_email', with: 'peter@example.com'
      click_button 'Sign up'
      expect(page).to have_content("Password can't be blank")
    end
    scenario 'Valid email' do
      visit new_user_registration_path
      fill_in 'user_name', with: 'Peter'
      fill_in 'user_DOB', with: Date.new(2000, 9, 17)
      fill_in 'user_email', with: 'peterexample.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      click_button 'Sign up'
      expect(page).to have_content('Email is invalid')
    end
  end
  describe 'fields in access pages' do
    it 'email field in login page' do
      visit new_user_session_path
      expect(page).to have_content 'Email'
    end
    it 'password field in login page' do
      visit new_user_session_path
      expect(page).to have_content 'Password'
    end
    it 'name field in signup page' do
      visit new_user_registration_path
      expect(page).to have_content 'Name'
    end
    it 'DOB field in signup page' do
      visit new_user_registration_path
      expect(page).to have_content 'Dob'
    end
    it 'email field in signup page' do
      visit new_user_registration_path
      expect(page).to have_content 'Email'
    end
    it 'password field in signup page' do
      visit new_user_registration_path
      expect(page).to have_content 'Password'
    end
    it 'password confirmation field in signup page' do
      visit new_user_registration_path
      expect(page).to have_content 'confirmation'
    end
  end
end