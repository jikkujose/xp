require 'nokogiri'

n = Nokogiri::HTML::parse STDIN.read

n.css("#{ARGV.first}").each do |element|
  puts element.value
end
