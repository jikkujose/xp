require 'nokogiri'
require 'open-uri'

module XP
  class Scraper
    attr_reader :output

    def initialize(_url)
      url(_url)
    end

    def url(value)
      @url = value
      refresh
      self
    end

    def filter selector
      @output = css?(selector) ? @output.css(selector) : @output.xpath(selector)
      self
    end

    def refresh
      download
      parse
    end

    private

    def css? selector
      selector[0] != '/'
    end

    def download
      @page = open(@url).read
    end

    def parse
      @output = Nokogiri::HTML::parse @page
    end
  end
end
