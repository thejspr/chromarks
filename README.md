# Bkmrk

Bookmarks file location:

* Chrome (OSX)

    ~/Library/Application\ Support/Google/Chrome/Default/Bookmarks

* Chrome Canary (OSX)

    ~/Library/Application\ Support/Google\ Canary/Chrome/Default/Bookmarks


## Installation

Add this line to your application's Gemfile:

    gem 'bkmrk'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bkmrk

## Usage

Running Bkmrk without any parameters output all bookmarks:

    $ bkmrk

To search bookmarks, provide a search term like so:

    $ bkmrk <search term(s)>

To open the first matching results use the `-o` option:

    $ bkmrk -o <search term(s)>

### Useful aliases

    alias bm='bkmrk'
    alias bmo='bkmrk -o'

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
