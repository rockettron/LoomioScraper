module LoomioScraper
	class Scraper

	   	def initialize(url)
    		@dom = Scraper.html_loader(url)
    		@attributes = []
    	end

		def self.html_loader(url)
#			return Nokogiri::HTML(File.open('index.html').read)	
			gem_path = LoomioScraper::home_dir
			
			script_path = gem_path + '/lib/LoomioScraper/script.js'
			file_path = gem_path + '/index.html'
	    	dom = html = nil
            pid ||= Process.spawn('phantomjs', script_path, url, file_path)
	  		Process.waitpid(pid)
    
            html ||= File.open(file_path).read
            File.delete(file_path)
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