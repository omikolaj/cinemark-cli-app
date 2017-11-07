class NewMovies::CLI

WIDTH = 70

  def center(string, c = "-")
     string = " #{string} " if string != ""
     until string.length >= WIDTH
       string.prepend(c)
       string << (c)
     end
     string.prepend("\n")
   end

  def wrap(s)
       s.gsub(/(.{1,#{WIDTH}})(\s+|\Z)/, "\\1\n  ")
     end

  def call
    get_movies
    main_menu
  end

  def get_movies
    NewMovies::Movie.create_movie_list(NewMovies::Scraper.scrape_coming_soon_movies)
  end

  def list_new_movies
    puts center("MOVIES COMING SOON TO CINEMARK THEATRES")
    puts " "
    NewMovies::Movie.all.each_with_index do |movie, index|
      puts "    #{index+1}. #{movie.title}" if index.to_i < 9
      puts "   #{index+1}. #{movie.title}" if index.to_i > 9
    end
      puts center("END OF LIST")
      puts " "
  end

  def menu
    print "Please select a number: "
    input = gets.strip.downcase
    if input == "exit"
      goodbye
    elsif input.to_i > 0 && input.to_i <= NewMovies::Movie.all.length
      movie_details(input)
      menu_restart
    elsif input == "list"
      menu
    else
      puts "Invalid entry."
      menu
    end
  end

  def main_menu
    list_new_movies
    puts "Which movie do you want more details about?"
    menu
  end

  def menu_restart
    puts " "
    print "Enter 'list' to view the movies again or enter 'exit': "
      input = gets.strip.downcase
      if input == "exit"
        goodbye
      elsif input == "list"
        main_menu
      else
        menu_restart
      end
  end

  def movie_details(input)
    details = NewMovies::Movie.find_movie_by_index(input)
    puts center("#{details.title.upcase}")
    puts " "
    puts "  URL: #{details.url}" if details.url
    puts "  Runtime: #{details.runtime}" if details.runtime
    puts "  Rating: #{details.rating}" if details.rating != ""
    puts "  Genre: #{details.genre}" if details.genre
    puts "  Release Date: #{details.release_date}" if details.release_date
    puts "  Director: #{details.director}" if details.director
    puts wrap("  Cast: #{details.cast}") if details.cast
    puts wrap("\n  Synopsis: #{details.synopsis}") if details.synopsis
    puts "  Movie Site: #{details.movie_site}" if details.movie_site
    puts center("END OF DETAILS")
  end

  def goodbye
    puts "See you next time!"
    exit
  end

end
