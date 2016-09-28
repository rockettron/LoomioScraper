module LoomioScraper
	class Scraper

	   	def initialize(url, *args)
    		@dom = Scraper.html_loader(url, *args)
    		@attributes = []
    	end

		def self.html_loader(url, *args)
	    	dom = html = nil
    		file = args[0] || "index.html"
            pid ||= Process.spawn('phantomjs', "lib/LoomioScraper/script.js", url)
	  		Process.waitpid(pid)
    
            html ||= File.open(file).read
            File.delete(file)
            dom ||= Nokogiri::HTML(html)    
    	end

		def to_hash
	    	@attributes.reduce({}) { |hash, attr| hash[attr.to_sym] = self.send(attr.to_sym); hash }
	    end

    	def attributes
    		@attributes
    	end

	end	
end