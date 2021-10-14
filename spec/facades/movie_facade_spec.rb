require 'rails_helper'

RSpec.describe MovieFacade do
  describe "class methods" do
    describe '.top_40_movies' do
      it 'returns a list of 40 top rated movies' do
        top_40_movies = MovieFacade.top_40_movies

        expect(top_40_movies).to be_a(Array)
        expect(top_40_movies.count).to eq(40)
      end
    end
  end
end
