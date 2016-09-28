require_relative "helper"

module LoomioScraper
	class Comment < LoomioScraper::Scraper
		def initialize(*attr)
			super(*attr)
			@attributes = %w{
				author_name
				comment
			}
		end

		def author_name
			@author_name ||= @dom.at_css('.media-body').text.strip
		end

		def comment
			@comment ||= @dom.at_css('div[marked]=comment.cookedBody()').text.strip
		end

	end

	class Activity < LoomioScraper::Scraper
		def initialize(*attr)
			super(*attr)
			@attributes = %w{ comments }
		end

		def comments
			@comments ||= @dom.css('.activity-card__activity-list').map { |comment| comment }
		end
	end
end