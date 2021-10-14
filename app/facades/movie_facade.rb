class MovieFacade
  def self.top_40_movies
    movies = MovieService.top_rated_movies('1') + MovieService.top_rated_movies('2')
    movies.map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.search_by_title(title)
    movies = MovieService.movie_search(title)
    movies.map do |movie_data|
      Movie.new(movie_data)
    end
  end
end
