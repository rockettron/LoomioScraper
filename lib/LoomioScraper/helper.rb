module LoomioScraper
	class Scraper

	   	def initialize(url)
    		@dom = Scraper.html_loader(url)
    		@attributes = []
    	end

		def self.html_loader(url)
	    	dom = html = nil
    		begin
	    		#html ||= open(URI.parse(url))
    			dom ||= Nokogiri::HTML(File.open('index.html'))
    		rescue
	    		puts "Can not download html file"
    		end
    		dom
    	end

		def to_hash
	    	@attributes.reduce({}) { |hash, attr| hash[attr.to_sym] = self.send(attr.to_sym); hash }
	    end

    	def attributes
    		@attributes
    	end

	end	
end