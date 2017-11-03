class NewMovies::CLI

  def call
    menu
  end

  def list_new_movies
    puts "Movies Coming Soon:"
    @movies = NewMovies::Movie.all
  end

  def menu

    list_new_movies
    input = nil
    NewMovies::Movie.all1
    while input != "exit"
      puts "Enter the number of the movie you would like to see more details about or type movies to see a list of movies again or type exit:"
      input = gets.strip.downcase

      if input.to_i > 0

        puts NewMovies::Movie.all[input.to_i - 1]
      elsif input == "list"
        list_new_movies
      else
        puts "not sure what you meant"
      end
    end
  end

  def goodbye
    puts "See you next time!"
  end

end
