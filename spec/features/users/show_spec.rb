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

  it 'displays a friends section' do
    friend = User.create!(email: "test123@gmail.com", username: "test123", password: "test", password_confirmation: "test")
    expect(page).to have_content("Friends")
    expect(page).to have_content("You currently have no friends.")
    fill_in :search, with: friend.email
    click_button "Add Friend"
    expect(current_path).to eq(user_dashboard_path(@user))
    expect(page).to have_content(friend.username)
    expect(page).to have_content("You've successfully added a new friend!")
  end

  it 'displays a viewing parties section' do
    expect(page).to have_content("Viewing Parties")
  end
end
