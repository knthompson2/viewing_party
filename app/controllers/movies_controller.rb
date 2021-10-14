class MoviesController < ApplicationController
  def index
    @top_40 = MovieFacade.top_40_movies
  end
end
