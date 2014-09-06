## xp

A Ruby Gem that queries an XML or HTML document fed through the stdin using XPath (or even CSS selectors) (provided as the arguments).

### Installation

    $ gem install xp

### Usage

    $ curl -s 'https://news.ycombinator.com' | xp --text '//td[class="title"]/a' 

OR

    $ curl -s 'https://news.ycombinator.com' | xp --text 'td.title > a'
