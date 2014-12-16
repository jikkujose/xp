require './lib/xp'

HN_URL = 'https://news.ycombinator.com'
HN_CSS_SELECTOR = '.pagetop > a'
HN_CSS_RESULT = '<a href="newest">new</a>'
HN_XPATH_CHAIN_SELECTOR = '//a/@href'
HN_XPATH_CHAIN_RESULT = 'newest'
HN_XPATH_SELECTOR = '//title'
HN_XPATH_RESULT = '<title>Hacker News</title>'
HN_CSS_CHAIN_SELECTOR = 'title'
HN_CSS_CHAIN_RESULT = '<title>Hacker News</title>'
HN_TITLE = '<title>Hacker News</title>'

class TestXP < Minitest::Test
  def setup
    @xp = XP::Scraper.new(HN_URL)
  end

  def test_xp_responds_to_url
    assert_respond_to @xp, :url
  end

  def test_url_method_returns_the_object
    assert_equal @xp.url('http://google.com'), @xp
  end

  def test_if_responds_to_filter
    assert_respond_to @xp, :filter
  end

  def test_if_filter_returns_the_object_itself
    assert_instance_of XP::Scraper, @xp.filter(HN_CSS_SELECTOR)
  end

  def test_if_output_works
    assert_instance_of Nokogiri::XML::NodeSet, @xp.filter(HN_CSS_SELECTOR).output
  end

  def test_if_css_filter_works
    assert_equal HN_CSS_RESULT, @xp.filter(HN_CSS_SELECTOR).output.first.to_s
  end

  def test_if_xpath_filter_works
    assert_equal HN_XPATH_RESULT, @xp.filter(HN_XPATH_SELECTOR).output.first.to_s
  end

  def test_if_css_chaining_works
    assert_equal HN_CSS_CHAIN_RESULT, @xp.filter(HN_XPATH_SELECTOR).filter(HN_CSS_CHAIN_SELECTOR).output.first.to_s
  end

  def test_if_xpath_chaining_works
    assert_equal HN_XPATH_CHAIN_RESULT, @xp.filter(HN_CSS_SELECTOR).filter(HN_XPATH_CHAIN_SELECTOR).output.first.to_s
  end
end
