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
    menu
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
  end

  def menu
    list_new_movies
    input = nil
    puts "What movie do you want more details about?"
    print "Please select a number: "
    input = gets.strip.downcase
    if input == "exit"
      goodbye
    elsif input.to_i > 0
        movie_details(input)
    elsif input == "list"
        list_new_movies
    else
        puts "not sure what you meant"
      end
    end


  def movie_details(input)
    details = NewMovies::Movie.find_movie_by_index(input)
    puts center("#{details.title}.upcase")
    puts " "
    puts "  Title: #{details.title}" if details.title
    puts "  URL: #{details.url}" if details.url
    puts "  Runetime: #{details.runtime}" if details.runtime
    puts "  Rating: #{details.rating}" if details.rating
    puts "  Genre: #{details.genre}" if details.genre
    puts "  Release Date: #{details.release_date}" if details.release_date
    puts wrap("  Cast: #{details.cast}") if details.cast
    puts "  Director: #{details.director}" if details.director
    puts "  Movie Site: #{details.movie_site}" if details.movie_site
    puts wrap("\n  Synopsis: #{details.synopsis}") if details.synopsis
    puts " "
    puts center("END OF DETAILS")
    puts " "
  end


  def goodbye
    puts "See you next time!"
    exit
  end

end
