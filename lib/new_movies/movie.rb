require 'open-uri'
class NewMovies::Movie
attr_accessor :title, :runtime, :genre, :url

  def initialize(title = nil, url= nil)
    @title = title
    @url = url
  end

# If all is nil go get me all of the up coming movies ||= operator checks to see if the variable is nil and if it is the right side is executed
  def self.all
    @@all ||= scrape_coming_soon_movie_titles
  end

# scrape_coming_soon_movies will be a class method. We only need it to get us all of the movies that are coming soon and asign it to the all class array
  def self.scrape_coming_soon_movie_titles
    #binding.pry
    doc = Nokogiri::HTML(open("https://www.cinemark.com/movies/coming-soon"))
    doc.css("div.card .title").collect do |new_movie|
      self.new(new_movie.inner_text, "https://www.cinemark.com#{new_movie.attribute("href").value}")
    end
  end

  def self.find_movie_by_index(index)
    binding.pry
    self.all[index.to_i - 1]
  end



  def self.movie_details
    movie_1 = self.new
    @@all << movie_1
    movie_1.title = "Star Wars"
    movie_1.runtime = "150 min"
    movie_1.genre = "Action, Adventure, Sci-Fi, Fantasy"
    movie_1.url = "https://www.cinemark.com/star-wars-the-last-jedi"
  end


end
