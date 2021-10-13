require 'rails_helper'

RSpec.describe MovieService do
  before :each do
    @movies = MovieService.new
  end

  it 'exits' do
    expect(@movies).to be_a(MovieService)
  end

  it 'returns a list of 20 top rated movies by page number' do
    top_movies = @movies.top_rated_movies(1)

    expect(top_movies).to be_a(Array)
    expect(top_movies.first).to have_key(:id)
    expect(top_movies.first).to have_key(:title)
    expect(top_movies.first).to have_key(:overview)
    expect(top_movies.first).to have_key(:vote_average)
    expect(top_movies.first).to have_key(:poster_path)
    expect(top_movies.count).to eq(20)
  end

  it 'returns a list of 40 top rated movies' do
    top_40_movies = @movies.top_40_movies

    expect(top_40_movies).to be_a(Array)
    expect(top_40_movies.first).to have_key(:id)
    expect(top_40_movies.first).to have_key(:title)
    expect(top_40_movies.first).to have_key(:overview)
    expect(top_40_movies.first).to have_key(:vote_average)
    expect(top_40_movies.first).to have_key(:poster_path)
    expect(top_40_movies.count).to eq(40)
  end

  it 'returns an array of movie genres by movie id' do
    movie_genre = @movies.movie_genres(238)

    expect(movie_genre).to be_a(Array)
    expect(movie_genre.first[:name]).to eq("Drama")
  end

  it 'returns an array of movie reviews' do
    movie_review = @movies.get_reviews(238)

    expect(movie_review).to be_a(Array)
    expect(movie_review.first).to have_key(:author)
    expect(movie_review.first).to have_key(:content)
  end

  it 'returns an array of movie cast members' do
    cast_members = @movies.get_cast_members(238)

    expect(cast_members).to be_a(Array)
    expect(cast_members.first).to have_key(:name)
    expect(cast_members.first).to have_key(:character)
  end
end
