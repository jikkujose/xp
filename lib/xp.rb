require 'nokogiri'
require 'open-uri'

module XP
  def filter(selector)
    selection_method = css?(selector) ? :css : :xpath
    Nokogiri(self).send(selection_method, selector).to_html
  end

  def css?(selector)
    selector[0] != '/'
  end

  def download
    open(self).read
  end
end
