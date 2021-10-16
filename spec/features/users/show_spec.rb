require 'rails_helper'

RSpec.describe 'User dashboard' do
  before :each do
    @user = User.create!(username: "username1", email: "testemail@gmail.com", password: "moviesRcool")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit user_dashboard_path(@user)
  end

  it 'displays a "Discover Movies" button' do
    expect(page).to have_link("Discover Movies")

    click_on "Discover Movies"

    expect(current_path).to eq(discover_path)
  end

  it 'displays a friends section and user can add friends' do
    friend1 = User.create!(email: "test123@gmail.com", username: "test123", password: "test", password_confirmation: "test")
    friend2 = User.create!(email: "friend2@gmail.com", username: "Friend2", password: "test", password_confirmation: "test")
    friend3 = User.create!(email: "friend3@gmail.com", username: "Friend3", password: "test", password_confirmation: "test")
    expect(page).to have_content("Friends")
    expect(page).to have_content("You currently have no friends.")
    fill_in :email, with: friend1.email
    click_button "Add Friend"

    expect(current_path).to eq(user_dashboard_path(@user))
    expect(page).to have_content(friend1.username)
    expect(page).to have_content("You've successfully added a new friend!")
    fill_in :email, with: friend2.email
    click_button "Add Friend"
    @user.reload
    visit user_dashboard_path(@user)
    expect(page).to have_content(friend1.username)
    expect(page).to have_content(friend2.username)

  end

  it 'has sad paths for adding friends user is already friends with' do
    friend1 = User.create!(email: "test123@gmail.com", username: "test123", password: "test", password_confirmation: "test")
    friend2 = User.create!(email: "friend2@gmail.com", username: "Friend2", password: "test", password_confirmation: "test")
    friend3 = User.create!(email: "friend3@gmail.com", username: "Friend3", password: "test", password_confirmation: "test")

    fill_in :email, with: friend1.email
    click_button "Add Friend"
    visit user_dashboard_path(@user)
    fill_in :email, with: friend1.email
    click_button "Add Friend"
    save_and_open_page
    expect(page).to have_content("You are already friends with that person")
  end

  it 'has sad paths invalid email when adding friend' do
    friend1 = User.create!(email: "test123@gmail.com", username: "test123", password: "test", password_confirmation: "test")
    friend2 = User.create!(email: "friend2@gmail.com", username: "Friend2", password: "test", password_confirmation: "test")
    friend3 = User.create!(email: "friend3@gmail.com", username: "Friend3", password: "test", password_confirmation: "test")

    fill_in :email, with: "friend4@gmail.com"
    click_button "Add Friend"
    save_and_open_page

    expect(page).to have_content("Invalid email. You have not added a new friend.")
  end

  it 'has sad paths for trying to add onself as friend' do

    fill_in :email, with: @user.email
    click_button "Add Friend"
    save_and_open_page

    expect(page).to have_content("You cannot add yourself as a friend")
  end

  it 'displays a viewing parties section' do
    expect(page).to have_content("Viewing Parties")
  end
end
