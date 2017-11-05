require 'open-uri'
class NewMovies::Movie
attr_accessor :title, :url, :runtime, :genre, :release_date, :cast, :director, :movie_site, :synopsis, :rating

  def initialize(title = nil, url= nil)
    @title = title
    @url = url

  end


  def self.all
    @@all ||= NewMovies::Scraper.scrape_coming_soon_movies
  end


  def self.find_movie_by_index(index)
    NewMovies::Scraper.scrape_movie_details(index)
    self.all[index.to_i - 1]
  end


end
