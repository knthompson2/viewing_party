require 'rails_helper'

RSpec.describe "Viewing party new" do
  before :each do
    @user = User.create(username: 'test_user', email: "user@test.com", password: "test_password")
    @movie_1 = MovieFacade.search_by_id(238)
    @party = Party.create!(
      title: @movie_1.title,
      movie_id: @movie_1.id,
      date: '2021-10-31'.to_date,
      start_time: '2021-10-31 10:00:00 -0600'.to_time,
      duration: 125,
      user_id: @user.id)

    @friend_1 = User.create!(username: 'friend', email: 'friend@gmail.com', password: 'password')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    @user.friends << @friend_1
    visit movie_path(@movie_1.id)
    click_on "Create Viewing Party for Movie"
  end

  it 'displays a form to create a new viewing party', :vcr do
    expect(page).to have_content('Viewing Party Details')
    expect(page).to have_content('Movie Title')
    expect(page).to have_content('The Godfather')
    expect(page).to have_content('Duration of Party')
    expect(page).to have_content('Day')
    expect(page).to have_content('Start Time')
    expect(page).to have_content('Friends')
    expect(page).to have_button('Create Party')
  end

  it 'can create a new viewing party', :vcr do
    fill_in :duration, with: 175
    fill_in :date, with: Date.today
    select "02 PM", :from => "[start_time(4i)]"
    select "00", :from => "[start_time(5i)]"
    check 'friend'

    click_on "Create Party"

    expect(current_path).to eq(user_dashboard_path(current_user))
    expect(page).to have_content(@party.title)
  end
end
