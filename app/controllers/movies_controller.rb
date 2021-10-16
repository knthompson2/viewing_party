class MoviesController < ApplicationController
  def index
    @movies = if params[:search]
                MovieFacade.search_by_title(params[:search])
              else
                MovieFacade.top_40_movies
              end
  end

  def show
    @movie = MovieFacade.search_by_id(params[:id])
  end
end
