class NewMovies::CLI

  def call
    menu
  end

  def get_movies
    NewMovies::Movie.create_movie_list(NewMovies::Scraper.scrape_coming_soon_movies)
  end


  def list_new_movies
    get_movies
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
      elsif input == "list"
        list_new_movies
      else
        puts "not sure what you meant"
      end
    end
  end

  def movie_details(input)
    details = NewMovies::Movie.find_movie_by_index(input)
    #binding.pry
    puts " "
    puts "-----------MOVIE DETAILS-----------"
    puts " "
    if details.title
      puts "Title: #{details.title}"
      end
    if details.url
      puts "URL: #{details.url}"
      end
    if details.runtime
      puts "Runetime: #{details.runtime}"
      end
    if details.genre
      puts "Genre: #{details.genre}"
      end
    if details.release_date
      puts "Release Date: #{details.release_date}"
      end
    if details.cast
      puts "Cast: #{details.cast}"
      end
    if details.director
      puts "Director: #{details.director}"
      end
    if details.movie_site
      puts "Movie Site: #{details.movie_site}"
      end
    if details.synopsis
      puts "Synopsis: #{details.synopsis}"
      end
    if details.rating
      puts "Rating: #{details.rating}"
    end
    puts " "
    puts "-----------END OF DETAILS-----------"
    puts " "
  end


  def goodbye
    puts "See you next time!"
  end

end
