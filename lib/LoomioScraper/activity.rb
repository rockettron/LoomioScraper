require_relative "helper"

module LoomioScraper
	class Comment < LoomioScraper::Scraper
		def initialize(*attr)
			super(*attr)
			@attributes = %w{
				link
				author_name
				comment
			}
		end

		def author_name
			@author_name ||= @dom.at_css('.media-body h3').text.strip
		end

		def link
			link ||= @dom.at_css('.media-body a')['href']
		end

		def comment
			@comment ||= @dom.at_css('.thread-item__body').text.strip#{}"div[marked='comment.cookedBody()']").text
		end
	end

	class Activity < LoomioScraper::Scraper
		def initialize(*attr)
			super(*attr)
			@attributes = %w{ comments }
		end

		def comments
			@comments ||= @dom.css('.activity-card__activity-list').map { |comment| Comment.new(comment).to_hash }
		end
	end
end
#a = LoomioScraper::Activity.new("")