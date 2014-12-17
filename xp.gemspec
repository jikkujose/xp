lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name = "xp"
  s.version = "2.0.0"
  s.authors = ["Jikku Jose"]
  s.email = ['jikkujose@gmail.com']
  s.summary = "Gem that enables String class to help quick & dirty scraping tasks."
  s.description = "Provides a monkey patched String class that can download & filter web pages using CSS/XPATH selectors; also has a very intuitive method to download files directly from their urls."
  s.homepage = "http://github.com/JikkuJose/xp"
  s.license = "MIT"
  s.files = `git ls-files -z`.split("\x0")
  s.executables = ["xp"]

  s.add_dependency "nokogiri", '~> 1.6'
end
