require 'rails_helper'

RSpec.describe "Movie show page" do
  it 'displays movie attributes', :vcr do
    movie = MovieFacade.search_by_id(238)

    visit movie_path(movie.id)

    expect(page).to have_content(movie.title)
    expect(page).to have_content(movie.overview)
    expect(page).to have_content(movie.rating)
    expect(page).to have_content(movie.runtime)
    expect(page).to have_content(movie.genres.join(", "))

    movie.cast.each do |actor|
      expect(page).to have_content("#{actor.name} as #{actor.character}")
    end

    expect(page).to have_content(movie.reviews.size)
    movie.reviews.each do |review|
      expect(page).to have_content(review.author)
      expect(page).to have_content("The rejected offer starts what turns into an all out mafia war")
    end
  end
end
