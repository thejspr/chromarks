# Chromarks

Currently only support for bookmarks at this location:

* Chrome (OSX)

    ~/Library/Application\ Support/Google/Chrome/Default/Bookmarks

## Installation

Install via Rubygems.org:

    $ gem install chromarks

## Usage

Running Bkmrk without any parameters output all bookmarks:

    $ chromarks

To open a given bookmark run:

    $ chromarks  <ID>

To search bookmarks, provide a search term like so:

    $ chromarks '<search term(s)>'

### Useful alias

    alias cm='chromarks'

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
