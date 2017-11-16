class NewMovies::Movie
  attr_accessor :title, :url, :runtime, :genre, :release_date, :cast, :director, :movie_site, :synopsis, :rating, :index

  @@all = []

  def initialize(title ,url)
    @title = title
    @url = url
    @@all << self
  end

  def attribute_assignment(movies_hash_attributes)
    movies_hash_attributes.each{|key, value| self.send(("#{key}="), value)}
  end

  def self.all
    @@all
  end

  def self.find_movie_by_index(index)
    movie = NewMovies::Movie.all[index.to_i - 1]
    movie.attribute_assignment(NewMovies::Scraper.scrape_movie_details(movie))
    movie
  end

end
