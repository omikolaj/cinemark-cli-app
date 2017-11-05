class NewMovies::Scraper




  def self.scrape_coming_soon_movies
    doc = Nokogiri::HTML(open("https://www.cinemark.com/movies/coming-soon"))
    doc.css("div.card .title").collect do |new_movie|
      NewMovies::Movie.new(new_movie.inner_text, "https://www.cinemark.com#{new_movie.attribute("href").value}")
    end
  end


  def self.scrape_movie_details(index)
    movie = NewMovies::Movie.all[index.to_i - 1]
    doc = Nokogiri::HTML(open("#{movie.url}"))
    binding.pry

      if doc.xpath("//h3[contains(text(), 'Release Dates')]").text.include?("Release Dates")
        movie.release_date = doc.xpath("//h3[contains(text(), 'Release Dates')]/following-sibling::p")[0].text.strip
      end

      if doc.xpath("//h3[contains(text(), 'Rating')]").text.include?("Rating")
        movie.rating = doc.xpath("//h3[contains(text(), 'Rating')]/following-sibling::p")[0].text.strip
        end
      if doc.xpath("//h3[contains(text(), 'Runtime')]").text.include?("Runtime")
        movie.runtime = doc.xpath("//h3[contains(text(), 'Runtime')]/following-sibling::p").text
        end
      if doc.xpath("//h3[contains(text(), 'Genre')]").text.include?("Genre")
        movie.genre = doc.xpath("//h3[contains(text(), 'Genre')]/following-sibling::p")[0].text
        end
      if doc.xpath("//h3[contains(text(), 'Cast')]").text.include?("Cast")
        movie.cast = doc.xpath("//h3[contains(text(), 'Cast')]/following-sibling::p")[0].text
        end
      if doc.xpath("//h3[contains(text(), 'Director')]").text.include?("Director")
        movie.director = doc.xpath("//h3[contains(text(), 'Director')]/following-sibling::p")[0].text
        end
      if doc.xpath("//h3[contains(text(), 'Synopsis')]").text.include?("Synopsis")
        movie.synopsis = doc.xpath("//h3[contains(text(), 'Synopsis')]/following-sibling::p")[0].text
        end
      if doc.xpath("//h3[contains(text(), 'Official Site')]").text.strip.include?("Official Site")
        movie.movie_site = doc.css("p.trunc").text.strip
      end
  end




end
