require 'nokogiri'

selector = ARGV.first

file = File.open("y.htm", "r").read

n = Nokogiri::HTML::parse( file )

# puts n.css(selector)
puts n.class
