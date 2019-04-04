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
        site = Site.create(url: url)
        doc = Nokogiri::HTML(open(url))

        hrefs = doc.css("a").map do |link|
          if (href = link.attr("href")) && !href.empty?
            href
          end
        end.compact.uniq
        hrefs.each {|link| Tag.create(name: 'a', content: link, site: site )}

        h1s = doc.css("h1").map {|h1| h1}.compact.uniq
        h1s.each {|link| Tag.create(name: 'h1', content: link, site: site )}

        h2s = doc.css("h2").map {|h2| h2}.compact.uniq
        h2s.each {|link| Tag.create(name: 'h2', content: link, site: site )}

        h2s = doc.css("h3").map {|h3| h3}.compact.uniq
        h2s.each {|link| Tag.create(name: 'h3', content: link, site: site )}

        site
      end
  end
end