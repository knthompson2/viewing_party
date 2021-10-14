class MovieService
  def movie_search(title)
    response = conn("/search/movie").get do |f|
      f.params['api_key'] = ENV['movie_key']
      f.params['query'] = title
      f.params['include_adult'] = false
    end
    parse_json(response)[:results]
  end

  def self.top_rated_movies(page)
    response = conn("/movie/top_rated").get do |f|
      f.params['api_key'] = ENV['movie_key']
      f.params['language'] = 'en-US'
      f.params['page'] = page
    end
    parse_json(response)[:results]
  end

  def movie_genres(movie_id)
    response = conn("/movie/#{movie_id}").get do |f|
      f.params['api_key'] = ENV['movie_key']
    end
    parse_json(response)[:genres]
  end

  def get_reviews(movie_id)
    response = conn("/movie/#{movie_id}/reviews").get do |f|
      f.params['api_key'] = ENV['movie_key']
    end
    parse_json(response)[:results]
  end

  def get_cast_members(movie_id)
    response = conn("/movie/#{movie_id}/credits").get do |f|
      f.params['api_key'] = ENV['movie_key']
    end
    parse_json(response)[:cast]
  end

  private

  def self.conn(url)
    Faraday.new("https://api.themoviedb.org/3#{url}")
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
