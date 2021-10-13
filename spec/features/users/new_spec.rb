require 'rails_helper'

RSpec.describe 'registration page' do
  it 'has a form for new users to register' do
    visit new_user_path
    save_and_open_page
    fill_in "user[email]", with: "testemail@gmail.com"
    fill_in "user[username]", with: "username1"
    fill_in "user[password]", with: "incorrect password"
    click_on "Create User"
    expect(current_path).to eq(root_path)
    expect(page).to have_content("You've successfully registered. You can now log in!")
  end
end
