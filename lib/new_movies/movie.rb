require 'open-uri'
class NewMovies::Movie
attr_accessor :title, :runtime, :genre, :url, :release_date, :cast, :director, :movie_site, :synopsis

  def initialize(title = nil, url= nil)
    @title = title
    @url = url
  end

# If all is nil go get me all of the up coming movies ||= operator checks to see if the variable is nil and if it is the right side is executed
  def self.all
    @@all ||= scrape_coming_soon_movies
  end

# scrape_coming_soon_movies will be a class method. We only need it to get us all of the movies that are coming soon and asign it to the all class array
  def self.scrape_coming_soon_movies
    doc = Nokogiri::HTML(open("https://www.cinemark.com/movies/coming-soon"))
    doc.css("div.card .title").collect do |new_movie|
      self.new(new_movie.inner_text, "https://www.cinemark.com#{new_movie.attribute("href").value}")
    end
  end

  def self.scrape_movie_details(index)
    movie = self.all[index.to_i - 1]
    doc = Nokogiri::HTML(open("#{movie.url}"))
    binding.pry
      movie.release_date = doc.css("div.hidden-xs p")[0].text.strip
      movie.rating = doc.css("div.hidden-xs p")[1].text.strip
      movie.runtime = doc.css("div.hidden-xs p")[2].text.strip
      if doc.css("#xsMovieDetails > div:nth-child(3) > h3:nth-child(1)").text.include?("Genre")
        movie.genre = doc.css("#xsMovieDetails > div:nth-child(3) > p:nth-child(2)").inner_text
      elsif doc.css("#xsMovieDetails > div:nth-child(3) > h3:nth-child(5)").text.incude("director")

      movie.cast = doc.css("#xsMovieDetails > div:nth-child(3) > p:nth-child(4)").inner_text
      movie.synopsis = doc.css("#xsMovieDetails > div:nth-child(3) > p:nth-child(6)").inner_text
end

  end

  def self.find_movie_by_index(index)
    binding.pry
    self.scrape_movie_details(index)
    self.all[index.to_i - 1]
  end


end
