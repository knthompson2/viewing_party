require 'rails_helper'

RSpec.describe 'Log Out' do
  it 'users can log out by clicking the sign out button' do
    user = User.create(username: 'test_user', email: "user@test.com", password: "test_password")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    click_on "Sign Out"

    expect(current_path).to eq(root_path)
    expect(page).to have_link("New to Viewing Party? Register Here")
    expect(page).to have_content("You've been logged out")
    expect(page).to have_button("Sign In")
    expect(page).to_not have_link("Sign Out")
  end
end
