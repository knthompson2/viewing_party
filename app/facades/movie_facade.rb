class MovieFacade
  def self.top_40_movies
    top_40 = MovieService.top_rated_movies('1') + MovieService.top_rated_movies('2')
    top_40.map do |movie_data|
      Movie.new(movie_data)
    end
  end
end
