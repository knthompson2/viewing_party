require 'rails_helper'

RSpec.describe MovieService do
  it 'returns a list of 20 top rated movies by page number', :vcr do
    top_movies = MovieService.top_rated_movies(1)

    expect(top_movies).to be_a(Array)
    expect(top_movies.first).to have_key(:id)
    expect(top_movies.first).to have_key(:title)
    expect(top_movies.first).to have_key(:overview)
    expect(top_movies.first).to have_key(:vote_average)
    expect(top_movies.first).to have_key(:poster_path)
    expect(top_movies.count).to eq(20)
  end

  # it 'returns an array of movie genres by movie id', :vcr do
  #   movie_genre = MovieService.movie_genres(238)
  #
  #   expect(movie_genre).to be_a(Array)
  #   expect(movie_genre.first[:name]).to eq("Drama")
  # end

  it 'returns an array of movie reviews', :vcr do
    movie_review = MovieService.get_reviews(238)

    expect(movie_review).to be_a(Array)
    expect(movie_review.first).to have_key(:author)
    expect(movie_review.first).to have_key(:content)
  end

  it 'returns an array of movie cast members', :vcr do
    cast_members = MovieService.get_cast_members(238)

    expect(cast_members).to be_a(Array)
    expect(cast_members.first).to have_key(:name)
    expect(cast_members.first).to have_key(:character)
  end

  it 'returns a list of movies by title search by page number', :vcr do
    title_search = MovieService.movie_search("The", 1)

    expect(title_search).to be_a(Array)
    expect(title_search.first).to have_key(:id)
    expect(title_search.first).to have_key(:title)
    expect(title_search.first).to have_key(:overview)
    expect(title_search.first).to have_key(:vote_average)
    expect(title_search.first).to have_key(:poster_path)
    expect(title_search.count).to eq(20)
  end

  it 'returns a movie by movie id', :vcr do
    movie = MovieService.search_by_id(238)

    expect(movie).to have_key(:id)
    expect(movie).to have_key(:title)
    expect(movie).to have_key(:overview)
    expect(movie).to have_key(:vote_average)
    expect(movie).to have_key(:poster_path)
  end
end
