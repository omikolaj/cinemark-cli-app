class NewMovies::Movie
attr_accessor :title, :runtime, :genre, :url
  @@all = []

  def self.all
    @@all
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
