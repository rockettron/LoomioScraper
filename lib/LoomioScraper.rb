require "nokogiri"
require "open-uri"
require "json"
require "LoomioScraper/version"
require "LoomioScraper/activity"

module LoomioScraper
  # Your code goes here...
  	def self.home_dir
		Gem::Specification.find_by_name(self.name).gem_dir
	end

end
