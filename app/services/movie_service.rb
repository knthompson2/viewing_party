class MovieService
  def self.movie_search(title, page)
    response = conn.get('/3/search/movie') do |f|
      f.params['query'] = title
      f.params['page'] = page
      f.params['include_adult'] = false
    end
    parse_json(response)[:results]
  end

  def self.search_by_id(movie_id)
    response = conn.get("/3/movie/#{movie_id}")
    parse_json(response)
  end

  def self.top_rated_movies(page)
    response = conn.get('/3/movie/top_rated') do |f|
      f.params['page'] = page
    end
    parse_json(response)[:results]
  end

  def self.upcoming
    response = conn.get('/3/movie/upcoming')
    parse_json(response)[:results]
  end

  def self.similar(movie_id)
    response = conn.get("/3/movie/#{movie_id}/similar")
    parse_json(response)[:results]
  end

  def self.get_reviews(movie_id)
    response = conn.get("/3/movie/#{movie_id}/reviews")
    parse_json(response)[:results]
  end

  def self.get_cast_members(movie_id)
    response = conn.get("/3/movie/#{movie_id}/credits")
    parse_json(response)[:cast]
  end

  def self.conn
    Faraday.new('https://api.themoviedb.org') do |f|
      f.params['api_key'] = ENV['movie_key']
    end
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
