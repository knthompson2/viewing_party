require 'rails_helper'

RSpec.describe "welcome page" do
  it 'displays welcome message, brief description of app' do
    visit root_path
    expect(page).to have_content("Welcome to Viewing Party")
    expect(page).to have_content("This app lets you watch movies with friends!")
  end

  it 'has a form for current users to sign in' do
    user_1 = User.create!(username: "username1", email: "testemail@gmail.com", password: "moviesRcool")
    visit root_path
    fill_in :email, with: "testemail@gmail.com"
    fill_in :username, with: "username1"
    fill_in :password, with: "moviesRcool"
    click_button("Sign In")
    expect(current_path).to eq(user_dashboard_path(user_1))
    expect(page).to have_content("Welcome, #{user_1.username}")
  end

  it "cannot log in with bad credentials" do
    user_1 = User.create!(username: "username1", email: "testemail@gmail.com", password: "moviesRcool")

    visit root_path

    fill_in :email, with: "testemail@gmail.com"
    fill_in :username, with: "username1"
    fill_in :password, with: "incorrect password"
    click_on "Sign In"
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Sorry, your credentials are bad.")
  end
  #
  it 'has a link to register as new user' do
    visit root_path
    click_link("New to Viewing Party? Register Here")
    expect(current_path).to eq(new_user_path)
  end
end
