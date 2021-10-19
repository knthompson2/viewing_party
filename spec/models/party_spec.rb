require 'rails_helper'

RSpec.describe Party, type: :model do
  describe "validations" do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:start_time)}
    it {should validate_presence_of(:date)}
    it {should validate_presence_of(:duration)}
    it {should validate_presence_of(:movie_id)}
  end

  describe "relationships" do
    it {should have_many(:invitees)}
    it {should have_many(:users).through(:invitees) }
  end
end
