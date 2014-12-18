lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name = "xp"
  s.version = "2.0.1"
  s.authors = ["Jikku Jose"]
  s.email = ['jikkujose@gmail.com']
  s.summary = "Ruby gem for intuitive web scraping"
  s.description = "Ruby gem that adds some methods to String class for intuitive HTML/XML scraping"
  s.homepage = "http://github.com/JikkuJose/xp"
  s.license = "MIT"
  s.files = `git ls-files -z`.split("\x0")
  s.executables = ["xp"]

  s.add_dependency "nokogiri", '~> 1.6'
end
