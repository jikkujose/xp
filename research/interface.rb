links.each do |link|
  link.page_source.to_nokogiri.css(selector).xpath(selector).each do |url|
    url.css(s1).xpath(s2).each do |image_link|
      image_link.to_s.download to: 'images'
    end
  end
end
