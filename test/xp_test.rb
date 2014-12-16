require './lib/xp'

XPATH_QUERY = '//title'
XPATH_RESULT = "<title>How You Know</title>\n"

CSS_QUERY = 'title'
CSS_RESULT = "<title>How You Know</title>\n"

class TestXP < Minitest::Test
  String.send(:include, XP)

  def setup
    @html = File.open('./test/test_content.html').read
  end

  def test_filter_with_css_selector
    assert_equal CSS_RESULT, @html.filter(CSS_QUERY)
  end

  def test_filter_with_xpath_selector
    assert_equal XPATH_RESULT, @html.filter(XPATH_QUERY)
  end
end
