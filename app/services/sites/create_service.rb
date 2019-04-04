require 'net/http'
require 'json'
require 'open-uri'
require 'nokogiri'
module Sites
  class CreateService
    def self.call(params)
      fetch_site(params[:url])
    end

    private
      def self.fetch_site(url)
        site = Site.new(url: url)
        doc = Nokogiri::HTML(open(url))
        hrefs = doc.css("a").map do |link|
          if (href = link.attr("href")) && !href.empty?
            href
          end
        end.compact.uniq
        hrefs.each {|link| site.tags << Tag.new(name: 'a', content: link )}
        site.save
      end
  end
end