# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "new_movies/version"

Gem::Specification.new do |spec|
  spec.name          = "new_movies_cinemark"
  spec.version       = NewMovies::VERSION
  spec.license       = "MIT"
  spec.summary       = "Scrapes movies that are coming to theatres soon"
  spec.description   = "Scrapes cinemark website for the movies and events that are coming to cinemark theatres soon"
  spec.authors       = ["Oskar Mikolajczyk"]
  spec.email         = ["omikolaj1@gmail.com"]
  spec.files         = ["lib/new_movies", "lib/new_movies/CLI.rb", "lib/new_movies/movie.rb", "lib/new_movies/version.rb", "lib/new_movies/cinemark_scraper.rb"]
  spec.executables   = ["new_movies"]

  spec.homepage      = "https://github.com/omikolaj/cinemark-cli-app"

  spec.add_development_dependency "rspec"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
end
