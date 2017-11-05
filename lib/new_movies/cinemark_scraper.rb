class NewMovies::Scraper

  def self.scrape_coming_soon_movies
    doc = Nokogiri::HTML(open("https://www.cinemark.com/movies/coming-soon"))
    movie_collection = []
    doc.css("div.card .title").collect do |new_movie|
      movie_collection << {:title => new_movie.inner_text,
                          :url => "https://www.cinemark.com#{new_movie.attribute("href").value}"}
    end
    movie_collection
  end

  def self.scrape_movie_details(movie)
    doc = Nokogiri::HTML(open("#{movie.url}"))
    attribute_values ={}
    attributes = {"Release Dates" => "release_date", "Rating" => "rating", "Runtime" => "runtime", "Genre" => "genre", "Cast" => "cast", "Director" => "director", "Synopsis" => "synopsis"}
    attributes.each do |attribute, v|
      if doc.xpath("//h3[contains(text(), '#{attribute}')]").text.include?("#{attribute}")
         attribute_values[[attributes[attribute]].join.to_sym] = doc.xpath("//h3[contains(text(), '#{attribute}')]/following-sibling::p")[0].text.strip
      end
      if doc.xpath("//h3[contains(text(), 'Official Site')]").text.strip.include?("Official Site")
        attribute_values["movie_site"] = doc.css("p.trunc").text.strip
      end
    end
    attribute_values
  end

end
