class Movie
  attr_reader :id,
              :title,
              :rating,
              :runtime,
              :genres,
              :overview,
              :image

  def initialize(info)
    @id = info[:id]
    @title = info[:title]
    @rating = info[:vote_average]
    @runtime = info[:runtime]
    @genres = info[:genres].nil? ? [] : info[:genres].map { |genre| genre[:name] }
    @overview = info[:overview]
    @image = "https://image.tmdb.org/t/p/original#{info[:poster_path]}"
  end

  def cast
    MovieFacade.cast_members(id)
  end

  def reviews
    MovieFacade.movie_reviews(id)
  end
end
