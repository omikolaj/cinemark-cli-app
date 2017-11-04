class NewMovies::CLI

  def call
    menu
  end

  def list_new_movies
    puts "Movies Coming Soon to Cinemark Theatres:"
    NewMovies::Movie.all.each_with_index do |movie, index|
      puts "#{index+1}. #{movie.title}"
    end
  end

  def menu
    list_new_movies
    input = nil
    while input != "exit"
      puts "Enter the number of the movie you would like to see more details about or type movies to see a list of movies again or type exit:"
      input = gets.strip.downcase

      if input.to_i > 0
        movie_details(input)
        #puts "#{NewMovies::Movie.find_movie_by_index(input)}"
        #puts NewMovies::Movie.all[input.to_i - 1]
      elsif input == "list"
        binding.pry
        list_new_movies
      else
        puts "not sure what you meant"
      end
    end
  end

  def movie_details(input)
    detials = NewMovies::Movie.find_movie_by_index(input)
    puts "Movie Title: #{detials.title}"
    puts "Link: #{detials.url}"
  end


  def goodbye
    puts "See you next time!"
  end

end
