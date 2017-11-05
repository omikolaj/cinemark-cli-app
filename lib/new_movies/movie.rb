require 'open-uri'
class NewMovies::Movie
attr_accessor :title, :url, :runtime, :genre, :release_date, :cast, :director, :movie_site, :synopsis, :rating, :index

  @@all = []

  def initialize(movie_list_hash)
    movie_list_hash.each{|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def attribute_assignment(movies_hash_attributes)
    #binding.pry
    movies_hash_attributes.each{|key, value| self.send(("#{key}="), value)}
  end

  def self.create_movie_list(movie_array)
    movie_array.each do |movie|
      NewMovies::Movie.new(movie)
    end
  end

  def self.all
    @@all
  end

  def self.find_movie_by_index(index)
    NewMovies::Movie.all[index.to_i - 1].attribute_assignment(NewMovies::Scraper.scrape_movie_details(NewMovies::Movie.all[index.to_i - 1]))
    NewMovies::Movie.all[index.to_i - 1]
  end



end
