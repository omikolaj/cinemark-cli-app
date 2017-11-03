require 'open-uri'
class NewMovies::Movie
attr_accessor :title, :runtime, :genre, :url


  def initialize
      #@@all << self
  end

# If all is nil go get me all of the up coming movies ||= operator checks to see if the variable is nil and if it is the right side is executed
  def self.all
    binding.pry
    @@all ||= scrape_coming_soon_movies
  end

# scrape_coming_soon_movies will be a class method. We only need it to get us all of the movies that are coming soon and asign it to the all class array
  def self.scrape_coming_soon_movies
    binding.pry
    doc = Nokogiri::HTML(open("https://www.cinemark.com/movies/coming-soon"))
    doc.css("div.card .title").collect do |new_movie|
      binding.pry
      movie = self.new
      movie.title = new_movie.inner_text
    end
  end



  def self.all1
    puts "
      1. Star Wars
      2. Wonder
      "
      movie_1 = self.new
      @@all << movie_1
      movie_1.title = "Star Wars"
      movie_1.runtime = "150 min"
      movie_1.genre = "Action, Adventure, Sci-Fi, Fantasy"
      movie_1.url = "https://www.cinemark.com/star-wars-the-last-jedi"

      #movie_2 = self.new
      #movie_2.title = "Wonder"
      #movie_2.runtime = "113 min"
      #movie_2.genre = "Drama"
      #movie_2.url = "https://www.cinemark.com/wonder"

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
