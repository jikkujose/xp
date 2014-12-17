require 'nokogiri'
require 'open-uri'
require 'uri'
require_relative './user_agents.rb'

module XP
  def to_nokogiri
    source = if url?
               self.page_source
             else
               self
             end

    Nokogiri(source)
  end

  def page_source(user_agent_alias: :mac_firefox, user_agent: nil)
    user_agent ||= USER_AGENTS[user_agent_alias]
    open(self, "User-Agent" => user_agent).read
  end

  def download(location: 'downloads', name: nil)
    FileUtils.mkdir_p location
    filename = (name || basename).to_s + extension
    File.open("#{location}/#{filename}", 'wb') do |f|
      f.write open(self).read
    end
  end

  def basename
    self.match(regex)[:basename]
  end

  def extension
    self.match(regex)[:extension]
  end

  def regex
    /.*\/(?<basename>.*)(?<extension>\.\w+)(\?.*)?/
  end

  def url?
    self.length < 200 && self =~ URI::regexp
  end

  def css selector
    self.to_nokogiri.css selector
  end

  def xpath selector
    self.to_nokogiri.xpath selector
  end
end

String.send :include, XP
