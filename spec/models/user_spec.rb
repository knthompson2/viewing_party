require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of(:username)}
    it {should validate_uniqueness_of(:username)}
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:password)}
  end

  describe "relationships" do
    it {should have_many(:friendships)}
    it {should have_many(:friends).through(:friendships) }
    it {should have_many(:invitees)}
    it {should have_many(:parties).through(:invitees) }
  end

  # describe 'instance methods' do
  #   it 'finds parties for a user', :vcr do
  #     @user = User.create!(username: "username1", email: "testemail@gmail.com", password: "moviesRcool")
  #     @user2= User.create!(username: "Friend 1", email: "friend1@gmail.com", password: "friend1" )
  #     @movie_1 = MovieFacade.search_by_id(238)
  #     @movie_2 = MovieFacade.search_by_id(239)
  #
  #     @party1 = Party.create!(
  #       title: @movie_1.title,
  #       movie_id: @movie_1.id,
  #       date: '2021-10-31'.to_date,
  #       start_time: '2021-10-31 10:00:00 -0600'.to_time,
  #       duration: 175,
  #       host: @user.id)
  #     @party2 = Party.create!(
  #       title: @movie_2.title,
  #       movie_id: @movie_2.id,
  #       date: '2021-12-31'.to_date,
  #       start_time: '2021-10-31 10:00:00 -0600'.to_time,
  #       duration: 200,
  #       host: @user.id)
  #
  #     invit1 = Invitee.create!(party: @party1, user: @user2)
  #     invit2 = Invitee.create!(party: @party2, user: @user2)
  #     binding.pry
  #     expect(@user2.invitees).to eq([invit1, invit2])
  #     expect(@user2.parties).to eq([@party1, @party2])
  #   end
  # end
end
