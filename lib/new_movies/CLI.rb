class NewMovies::CLI

  def call
    menu
  end

  def list_new_movies
    puts "Movies Coming Soon to Cinemark Theatres:"
    movie_list = NewMovies::Scraper.scrape_coming_soon_movies #.each_with_index do |movie, index|
      binding.pry
      NewMovies::Movie.create_movie_list(movie_list)
      puts "#{index+1}. #{movie[:title]}"

    #end
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
        list_new_movies
      else
        puts "not sure what you meant"
      end
    end
  end

  def movie_details(input)
    details = NewMovies::Movie.find_movie_by_index(input)

    puts "Movie Title: #{details.title}"
    puts "Link: #{details.url}"
    puts "Runtime: #{details.runtime}"
    puts "Director: #{details.director}"
    puts "Cast: #{details.cast}"
  end


  def goodbye
    puts "See you next time!"
  end

end
