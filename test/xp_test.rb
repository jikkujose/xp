require './lib/xp'

HTML = File.open('./test/test_content.html').read
XPATH_QUERY = '//title'
XPATH_RESULT = "<title>How You Know</title>\n"

CSS_QUERY = 'title'
CSS_RESULT = "<title>How You Know</title>\n"

LYNX = 'http://www.delorie.com/web/lynxview.html'
LYNX_TAGLINE = 'Lynx Viewer'
SIMPLE_PAGE_URL = "http://w3m.sourceforge.net/"
TEST_URL = 'http://qucentis.com/unavailable_404_link'
TEST_FILE_URL = 'http://abc.com/file/hello.mov?key=123&id=569'
TEST_FILE_BASENAME = 'hello'
TEST_FILE_EXTENSION = '.mov'

class TestXP < Minitest::Test
  String.send(:include, XP)

  def setup
    @html = File.open('./test/test_content.html').read
  end

  def test_all_methods_introduced
    %w|to_nokogiri page_source download|.each do |method|
      assert_respond_to "http://google.com", method
    end
  end

  def test_to_nokogiri
    assert_instance_of Nokogiri::HTML::Document, HTML.to_nokogiri
    assert_equal LYNX_TAGLINE, LYNX.to_nokogiri.xpath('//title/text()').to_s
  end

  def test_conversion_to_nodeset
    assert_equal HTML.to_nokogiri.css(CSS_QUERY).to_html, CSS_RESULT
    assert_equal HTML.to_nokogiri.css(XPATH_QUERY).to_html, XPATH_RESULT
    assert_equal HTML.to_nokogiri.css(XPATH_QUERY).xpath("//title/text()").to_html, "How You Know"
  end

  def test_page_source
    assert_equal SIMPLE_PAGE_URL.page_source.to_nokogiri.xpath("//address/a/text()").to_html, "aito@fw.ipsj.or.jp"
  end

  def test_css
    assert_respond_to "", :css
    assert_equal HTML.to_nokogiri.css(CSS_QUERY).to_html, HTML.css(CSS_QUERY).to_html
  end

  def test_xpath
    assert_respond_to "", :xpath
    assert_equal HTML.to_nokogiri.xpath(XPATH_QUERY).to_html, HTML.xpath(XPATH_QUERY).to_html
  end
end
