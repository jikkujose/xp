lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name = "xp"
  s.version = "0.0.1"
  s.authors = ["Jikku Jose"]
  s.summary = "A very simple commandline xpath parser."
  s.description = "A 10 line xpath parser using Nokogiri to be used in commandline."
  s.license = "MIT"
  s.executables = ["xp"]

  s.add_dependency "nokogiri"
end
