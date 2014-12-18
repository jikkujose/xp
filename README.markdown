## xp

Ruby gem that adds some methods to String class for intuitive HTML/XML scraping.

### Installation

``` bash
$ gem install xp
```

### Usage

``` bash
$ curl -s 'https://news.ycombinator.com' | xp --text '//td[class="title"]/a'
```

OR

``` bash
$ curl -s 'https://news.ycombinator.com' | xp --text 'td.title > a'
```

The gem can also be used in Ruby scripts, by `requiring` the gem - `require 'xp'`.

### Example

The following one liner can download all Dribbble shots from its home page:

``` ruby
'https://dribbble.com/'.css('.dribbble-link img').xpath('//img/@src').map(&:text).map(&:download)
```

### API

`xp` adds the following methods to the `String` class:

Method                                                         | Return type               | Remarks
-------------------------------------------------------------- | ------------------------- | -------------------------------------------------------------------------------
`to_nokogiri`                                                  | `Nokogiri::XML::Document` | Converts a url or a page source to Nokogiri object
`css(selector)`                                                | `String`                  | Filters a url or html string based on the selector
`xpath(selector)`                                              | `Strng`                   | Filters a url or html string based on the selector
`download(location: 'downloads', name: nil)`                   | `String`                  | Downloads the url in the string; can be customized via the optional parameters.
`page_source(user_agent_alias: :mac_firefox, user_agent: nil)` | `String`                  | Gets the page source of a url; can be customized via optional parameters.
`url?`                                                         | `Boolean`                 | Checks whether current string is a url.
