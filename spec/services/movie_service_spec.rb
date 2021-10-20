require 'rails_helper'

RSpec.describe MovieService do
  it 'returns a list of 20 top rated movies by page number', :vcr do
    top_movies = MovieService.top_rated_movies(1)
    top_movies_results = MovieService.top_rated_movies(1)[:results]

    expect(top_movies).to be_a(Hash)
    expect(top_movies_results.first).to have_key(:id)
    expect(top_movies_results.first[:id]).to be_an(Integer)
    expect(top_movies_results.first).to have_key(:title)
    expect(top_movies_results.first[:title]).to be_a(String)
    expect(top_movies_results.first).to have_key(:overview)
    expect(top_movies_results.first[:overview]).to be_a(String)
    expect(top_movies_results.first).to have_key(:vote_average)
    expect(top_movies_results.first[:vote_average]).to be_an(Float)
    expect(top_movies_results.first).to have_key(:poster_path)
    expect(top_movies_results.first[:poster_path]).to be_a(String)
    expect(top_movies_results.count).to eq(20)
  end

  it 'returns an array of movie reviews', :vcr do
    movie_review = MovieService.get_reviews(238)
    movie_review_results = MovieService.get_reviews(238)[:results]

    expect(movie_review).to be_a(Hash)
    expect(movie_review_results.first).to have_key(:author)
    expect(movie_review_results.first).to have_key(:content)
  end

  it 'returns an array of movie cast members', :vcr do
    cast_members = MovieService.get_cast_members(238)
    cast_members_results = MovieService.get_cast_members(238)[:cast]

    expect(cast_members).to be_a(Hash)
    expect(cast_members_results.first).to have_key(:name)
    expect(cast_members_results.first).to have_key(:character)
  end

  it 'returns a list of movies by title search by page number', :vcr do
    title_search = MovieService.movie_search("The", 1)

    expect(title_search).to be_a(Hash)
    expect(title_search[:results].first).to have_key(:id)
    expect(title_search[:results].first).to have_key(:title)
    expect(title_search[:results].first).to have_key(:overview)
    expect(title_search[:results].first).to have_key(:vote_average)
    expect(title_search[:results].first).to have_key(:poster_path)
    expect(title_search.count).to eq(4)
  end

  it 'returns a movie by movie id', :vcr do
    movie = MovieService.search_by_id(238)

    expect(movie).to have_key(:id)
    expect(movie).to have_key(:title)
    expect(movie).to have_key(:overview)
    expect(movie).to have_key(:vote_average)
    expect(movie).to have_key(:poster_path)
  end

  it 'returns upcoming movies', :vcr do
    upcoming = MovieService.upcoming
    upcoming_movies = MovieService.upcoming[:results]

    expect(upcoming).to be_a(Hash)
    expect(upcoming_movies.first).to have_key(:id)
    expect(upcoming_movies.first).to have_key(:title)
    expect(upcoming_movies.count).to eq(20)
  end

  it 'returns similar movies', :vcr do
    similar = MovieService.similar(238)
    similar_movies = MovieService.similar(238)[:results]

    expect(similar).to be_a(Hash)
    expect(similar_movies.first).to have_key(:id)
    expect(similar_movies.first).to have_key(:title)
    expect(similar.count).to eq(4)
  end
end
