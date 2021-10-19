require 'rails_helper'

RSpec.describe MovieFacade do
  describe "class methods" do
    describe '.top_40_movies', :vcr do
      it 'returns a list of 40 top rated movies' do
        top_40_movies = MovieFacade.top_40_movies

        expect(top_40_movies).to be_a(Array)
        expect(top_40_movies.count).to eq(40)
      end
    end

    describe '.search_by_title', :vcr do
      it 'returns a list of 40 movies searched by title' do
        search_results = MovieFacade.search_by_title("The")

        expect(search_results).to be_a(Array)
        expect(search_results.count).to eq(40)
      end
    end

     describe '.search_by_id', :vcr do
       it 'returns a movie by movie_id' do
         search_results = MovieFacade.search_by_id(238)
         expect(search_results.title).to eq("The Godfather")

       end
     end

    describe '.cast_members', :vcr do
      it 'returns a list of cast members by movie' do
        cast_list = MovieFacade.cast_members(238)

        expect(cast_list).to be_a(Array)
        expect(cast_list.count).to eq(10)
        expect(cast_list.first.name).to eq("Marlon Brando")
      end
    end

    describe '.movie_reviews', :vcr do
      it 'returns a list of reviews by movie' do
        reviews = MovieFacade.movie_reviews(238)

        expect(reviews).to be_a(Array)
        expect(reviews.count).to eq(1)
        expect(reviews.first.author).to eq("futuretv")
      end
    end

    describe '.upcoming_movies', :vcr do
      it 'returns a list of upcoming movies' do
        upcoming = MovieFacade.upcoming_movies

        expect(upcoming).to be_a(Array)
        expect(upcoming.count).to eq(20)
      end
    end

    describe '.similar_movies', :vcr do
      it 'returns a list of similar movies' do
        similar = MovieFacade.similar_movies(238)

        expect(similar).to be_a(Array)
        expect(similar.count).to eq(20)
      end
    end
  end
end
