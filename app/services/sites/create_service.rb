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

        hrefs = get_hrefs(doc)
        hrefs.each {|link| site.tags << Tag.new(name: 'a', content: link )}

        h1s = doc.css("h1").compact.uniq
        h1s.each {|link| site.tags << Tag.new(name: 'h1', content: link )}

        h2s = doc.css("h2").compact.uniq
        h2s.each {|link| site.tags << Tag.new(name: 'h2', content: link )}

        h2s = doc.css("h3").compact.uniq
        h2s.each {|link| site.tags << Tag.new(name: 'h2', content: link )}

        site.save
        site
      end

      def get_hrefs(doc)
        doc.css('a').map do |link|
          if (href = link.attr("href")) && !href.empty?
            href
          end
        end.compact.uniq
      end
  end
end