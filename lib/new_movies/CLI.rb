class NewMovies::CLI

  def call
    list_new_movies
    menu
  end

  def list_new_movies
    puts "Movies Coming Soon:"

  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the movie you would like to see more details about or type movies to see a list of movies again or type exit:"
      input = gets.strip.downcase
      case input
      when "1"
        puts "More info on movie 1.."
      when "2"
        puts "more info on movie 2..."
      when "movies"
        list_upcoming_movies
      else
        puts "Not sure what you want, type list or exit"
    end
  end
end

end
