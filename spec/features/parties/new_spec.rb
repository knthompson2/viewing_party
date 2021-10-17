require 'rails_helper'

RSpec.describe "Viewing party new" do
  before :each do
    @user = User.create(username: 'test_user', email: "user@test.com", password: "test_password")

    @party = Party.create!(
      title: 'The Godfather',
      movie_id: 238,
      date: '2021-10-31'.to_date,
      start_time: '2021-10-31 10:00:00 -0600'.to_time,
      duration: 125,
      user_id: @user.id)

    @friend_1 = User.create!(username: 'friend', email: 'friend@gmail.com', password: 'password')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    @user.friends << @friend_1
    visit new_party_path
  end

  it 'displays a form to create a new viewing party', :vcr do
    expect(page).to have_content('Viewing Party Details')
    expect(page).to have_content('Movie Title')
    expect(page).to have_content('Duration of Party')
    expect(page).to have_content('Day')
    expect(page).to have_content('Start Time')
    expect(page).to have_content('Friends')
    expect(page).to have_button('Create Party')
  end
end
