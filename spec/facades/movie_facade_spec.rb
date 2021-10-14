require 'rails_helper'

RSpec.describe MovieFacade do
  it 'returns top 40 movies' do
    movies = MovieFacade.new
    expect(movies).to be_a(MovieFacade)
    expect(movies.top_40_movies).to eq([])
  end
end
