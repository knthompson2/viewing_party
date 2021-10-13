class MovieService
  def top_rated_movies(page)
    response = conn("/movie/top_rated").get do |f|
      f.params['api_key'] = ENV['movie_key']
      f.params['language'] = 'en-US'
      f.params['page'] = page
    end
    data = parse_json(response)
    data[:results]
  end

  def top_40_movies
    top_rated_movies('1') + top_rated_movies('2')
  end

  def movie_genres(movie_id)
    response = conn("/movie/#{movie_id}").get do |f|
      f.params['api_key'] = ENV['movie_key']
    end
    data = parse_json(response)
    data[:genres]
  end

  def get_reviews(movie_id)
    response = conn("/movie/#{movie_id}/reviews").get do |f|
      f.params['api_key'] = ENV['movie_key']
    end
    data = parse_json(response)
    data[:results]
  end

  def get_cast_members(movie_id)
    response = conn("/movie/#{movie_id}/credits").get do |f|
      f.params['api_key'] = ENV['movie_key']
    end
    data = parse_json(response)
    data[:cast][0..9]
  end

  private

  def conn(url)
    Faraday.new("https://api.themoviedb.org/3#{url}")
  end

  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
