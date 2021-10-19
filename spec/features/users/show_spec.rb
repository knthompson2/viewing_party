require 'rails_helper'

RSpec.describe 'User dashboard' do
  describe 'single user tests for displays' do
    before :each do
      @user = User.create!(username: "username1", email: "testemail@gmail.com", password: "moviesRcool")
      @friend1 = User.create!(email: "test123@gmail.com", username: "test123", password: "test", password_confirmation: "test")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      @movie_1 = MovieFacade.search_by_id(238)
      @party = Party.create!(
        title: @movie_1.title,
        movie_id: @movie_1.id,
        date: '10-31-21',
        start_time: '10:30 AM',
        duration: 125,
        host: @user.id)
      Invitee.create!(party: @party, user: @user)
      Invitee.create!(party: @party, user: @friend1)
      visit user_dashboard_path(@user)
    end

    it 'displays a "Discover Movies" button', :vcr do
      expect(page).to have_link("Discover Movies")

      click_on "Discover Movies"

      expect(current_path).to eq(discover_path)
    end

    it 'displays a friends section and user can add friends', :vcr do
      friend2 = User.create!(email: "friend2@gmail.com", username: "Friend2", password: "test", password_confirmation: "test")
      friend3 = User.create!(email: "friend3@gmail.com", username: "Friend3", password: "test", password_confirmation: "test")
      expect(page).to have_content("Friends")
      expect(page).to have_content("You currently have no friends.")
      fill_in :email, with: @friend1.email
      click_button "Add Friend"

      expect(current_path).to eq(user_dashboard_path(@user))
      expect(page).to have_content(@friend1.username)
      expect(page).to have_content("You've successfully added a new friend!")
      fill_in :email, with: friend2.email
      click_button "Add Friend"
      @user.reload
      visit user_dashboard_path(@user)
      expect(page).to have_content(@friend1.username)
      expect(page).to have_content(friend2.username)

    end

    it 'has sad paths for adding friends user is already friends with', :vcr do
      friend2 = User.create!(email: "friend2@gmail.com", username: "Friend2", password: "test", password_confirmation: "test")
      friend3 = User.create!(email: "friend3@gmail.com", username: "Friend3", password: "test", password_confirmation: "test")

      fill_in :email, with: @friend1.email
      click_button "Add Friend"
      visit user_dashboard_path(@user)
      fill_in :email, with: @friend1.email
      click_button "Add Friend"

      expect(page).to have_content("You are already friends with that person")
    end

    it 'has sad paths invalid email when adding friend', :vcr do
      friend2 = User.create!(email: "friend2@gmail.com", username: "Friend2", password: "test", password_confirmation: "test")
      friend3 = User.create!(email: "friend3@gmail.com", username: "Friend3", password: "test", password_confirmation: "test")

      fill_in :email, with: "friend4@gmail.com"
      click_button "Add Friend"

      expect(page).to have_content("Invalid email. You have not added a new friend.")
    end

    it 'has sad paths for trying to add onself as friend', :vcr do

      fill_in :email, with: @user.email
      click_button "Add Friend"

      expect(page).to have_content("You cannot add yourself as a friend")
    end
  end

  it 'displays a viewing parties section', :vcr do
    user = User.create!(username: "username1", email: "testemail@gmail.com", password: "moviesRcool")
    friend1 = User.create!(email: "test123@gmail.com", username: "test123", password: "test", password_confirmation: "test")
    movie_1 = MovieFacade.search_by_id(238)
    party = Party.create!(
      title: movie_1.title,
      movie_id: movie_1.id,
      date: '10-31-21',
      start_time: '10:30 AM',
      duration: 125,
      host: user.id)
    user.friends << friend1
    Invitee.create!(party: party, user: user)
    Invitee.create!(party: party, user: friend1)

    user.friends << friend1
    visit root_path

    fill_in :email, with: "testemail@gmail.com"
    fill_in :password, with: "moviesRcool"
    click_on "Sign In"

    expect(page).to have_content("Viewing Parties")
    expect(page).to have_content(party.title)
    expect(page).to have_content(party.date)
    expect(page).to have_content(party.start_time)
    expect(page).to have_content("Hosting")

    click_on "Sign Out"
    fill_in :email, with: "test123@gmail.com"
    fill_in :password, with: "test"
    click_on "Sign In"
    expect(current_path).to eq(user_dashboard_path(friend1))
    expect(page).to have_content("Viewing Parties")
    expect(page).to have_content(party.title)
    expect(page).to have_content(party.date)
    expect(page).to have_content(party.start_time)
    expect(page).to have_content("Invited")
  end
end
