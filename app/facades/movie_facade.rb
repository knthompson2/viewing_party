class MovieFacade
  def self.top_40_movies
    movies = MovieService.top_rated_movies('1') + MovieService.top_rated_movies('2')
    movies.map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.search_by_title(title)
    movies = MovieService.movie_search(title, 1) + MovieService.movie_search(title, 2)
    movies.map do |movie_data|
      Movie.new(movie_data)
    end
  end

  #retrieve genre from here
  # def self.search_by_id(movie_id)
  #   movie = MovieService.search_by_id(movie_id)
  #   binding.pry
  #   Movie.new(movie)
  # end

  def self.cast_members(movie_id)
    data = MovieService.get_cast_members(movie_id)

    data[0..9].map do |actor_data|
      Actor.new(actor_data)
    end
  end

  def self.movie_reviews(movie_id)
    reviews = MovieService.get_reviews(movie_id)

    reviews.map do |review_data|
      Review.new(review_data)
    end
  end
end
