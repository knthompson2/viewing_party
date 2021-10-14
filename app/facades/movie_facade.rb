class MovieFacade
  def top_40_movies
    top_40 = MovieService.top_rated_movies('1') + MovieService.top_rated_movies('2')
  end
end
