require 'rails_helper'

RSpec.describe 'registration page' do
  describe 'happy path' do
    it 'has a form for new users to register with valid credentials' do
      visit new_user_path

      fill_in "user[email]", with: "testemail@gmail.com"
      fill_in "user[username]", with: "username1"
      fill_in "user[password]", with: "mypassword123"
      fill_in "user[password_confirmation]", with: "mypassword123"

      click_on "Create User"

      new_user = User.last

      expect(current_path).to eq(user_dashboard_path(new_user))
      expect(page).to have_content("You've successfully registered. You can now log in!")
    end
  end

  describe 'sad path' do
    it 'new users can not register with invalid credentials' do
      visit new_user_path

      fill_in "user[email]", with: "testemail@gmail.com"
      fill_in "user[username]", with: "username1"
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: ""

      click_on "Create User"

      expect(current_path).to eq(new_user_path)
      expect(page).to have_content("Sorry, you have missing or invalid credentials!")
    end
  end
end
