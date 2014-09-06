require 'nokogiri'

n = Nokogiri::HTML::parse STDIN.read

n.each do |element|
  puts element.attr ARGV.first
end
