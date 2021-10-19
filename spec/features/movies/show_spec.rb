require 'rails_helper'

RSpec.describe "Movie show page" do
  before :each do
    @movie = MovieFacade.search_by_id(238)
    @user = User.create!(username: "username1", email: "testemail@gmail.com", password: "moviesRcool")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit movie_path(@movie.id)
  end

  it 'displays movie attributes', :vcr do
    expect(page).to have_content(@movie.title)
    expect(page).to have_content(@movie.overview)
    expect(page).to have_content(@movie.rating)
    expect(page).to have_content(@movie.runtime)
    expect(page).to have_content(@movie.genres.join(", "))

    @movie.cast.each do |actor|
      expect(page).to have_content("#{actor.name} as #{actor.character}")
    end

    expect(page).to have_content(@movie.reviews.size)
    @movie.reviews.each do |review|
      expect(page).to have_content(review.author)
      expect(page).to have_content("The rejected offer starts what turns into an all out mafia war")
    end
  end

  it 'links a viewing party for that movie', :vcr do
    expect(page).to have_button("Create Viewing Party for Movie")
    click_button "Create Viewing Party for Movie"
    expect(current_path).to eq new_party_path
  end
end
