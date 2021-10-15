require 'rails_helper'

RSpec.describe Movie do
  it 'exits' do
    movie = Movie.new({title: 'The Godfather',
               overview: "Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.",
               vote_average: '8.7',
               genres: [{:id=>18, :name=>"Drama"}, {:id=>80, :name=>"Crime"}],
               id: '238',
               runtime: '175'})

    expect(movie).to be_a(Movie)
    expect(movie.title).to eq('The Godfather')
    expect(movie.overview).to eq('Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.')
    expect(movie.id).to eq('238')
    expect(movie.rating).to eq('8.7')
    expect(movie.runtime).to eq('175')
    # expect(movie.genres).to eq(["Drama", "Crime"])
  end
end
