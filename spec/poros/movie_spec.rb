require 'rails_helper'

RSpec.describe Movie do
  it 'exits' do
    movie = Movie.new({title: 'The Godfather',
               overview: "Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.",
               vote_average: '8.7',
               genres: [{:id=>18, :name=>"Drama"}, {:id=>80, :name=>"Crime"}],
               cast: [{name: "Marlon Brando", character: "Don Vito Corleone"}, {name: "Al Pacino", character: "Don Michael Corleone"}],
               reviews: [{author: "futuretv", content: "The Godfather Review by Al Carlson\r\n\r\nThe Godfather is a film considered by most to be one of the greatest ever made. From The American Film Institute to as voted by users on the Internet Movie Database (IMDB) it is consider to be one of the best."}],
               id: '238',
               runtime: '175'})

    expect(movie).to be_a(Movie)
    expect(movie.title).to eq('The Godfather')
    expect(movie.description).to eq('Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.')
    expect(movie.id).to eq('238')
    expect(movie.rating).to eq('8.7')
    expect(movie.runtime).to eq('175')
    expect(movie.genres).to eq(["Drama", "Crime"])
    expect(movie.cast).to eq([{name: "Marlon Brando", character: "Don Vito Corleone"}, {name: "Al Pacino", character: "Don Michael Corleone"}])
    expect(movie.reviews).to eq([{author: "futuretv", content: "The Godfather Review by Al Carlson\r\n\r\nThe Godfather is a film considered by most to be one of the greatest ever made. From The American Film Institute to as voted by users on the Internet Movie Database (IMDB) it is consider to be one of the best."}])
  end
end
