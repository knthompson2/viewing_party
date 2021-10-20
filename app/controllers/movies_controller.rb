class MoviesController < ApplicationController
  def index
    @movies = if params[:search] == ''
                MovieFacade.top_40_movies
              elsif params[:search]
                MovieFacade.search_by_title(params[:search])
              elsif params[:upcoming]
                MovieFacade.upcoming_movies
              else
                MovieFacade.top_40_movies
              end
  end

  def show
    @movie = MovieFacade.search_by_id(params[:id])
    @similar_movies = MovieFacade.similar_movies(@movie.id)
  end
end
