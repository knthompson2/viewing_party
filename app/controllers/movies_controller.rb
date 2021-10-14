class MoviesController < ApplicationController
  def index
    if params[:search]
      @movies = MovieFacade.search_by_title(params[:search])
    else
      @movies = MovieFacade.top_40_movies
    end
  end

  def show

  end
end
