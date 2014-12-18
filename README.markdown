## xp

Ruby gem that adds 4 new methods to String class that enables easy scraping of HTML/XML documents.

### Installation

    $ gem install xp

### Usage

    $ curl -s 'https://news.ycombinator.com' | xp --text '//td[class="title"]/a'

OR

    $ curl -s 'https://news.ycombinator.com' | xp --text 'td.title > a'

The gem can also be used in Ruby scripts, by `requiring` the gem:

``` ruby
require 'xp'
```

For instance to get all the Dribbble shots in the home page we can do:

``` ruby
d_shots = 'https://dribbble.com/'.css('.dribbble-link img').xpath('//img/@src').map &:text
```

A link in a string can be downloaded using `download` method. And in case you would like to download the Dribbble shots we have in the variable `d_shots`, just iterate it and call `download` on each like so:

``` ruby
d_shots.each &:download
```
