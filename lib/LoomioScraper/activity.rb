require_relative "helper"

module LoomioScraper
	class Comment < LoomioScraper::Scraper
		def initialize(dom)
			@dom = dom
			@attributes = %w{
				id
				link
				author_name
				comment
			}
		end

		def id
			@id ||= @dom.at_css('div div')['id'].gsub("comment-", "")
		end

		def author_name
			@author_name ||= @dom.at_css('.media-body h3').text.strip
		end

		def link
			@link ||= @dom.at_css('.media-body a')['href']
		end

		def comment
			@comment ||= @dom.at_css('.thread-item__body').text.strip
		end
	end

	class Activity < LoomioScraper::Scraper
		def initialize(url)
			super(url)
			@attributes = %w{ comments }
		end

		def comments
			@comments ||= @dom.css(".activity-card__activity-list li").map { |comment| Comment.new(comment).to_hash }
		end
	end
end
#a = LoomioScraper::Activity.new("https://www.loomio.org/d/gEZ5NO1W")