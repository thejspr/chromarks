require 'chromarks/version'
require 'chromarks/cli'

module Chromarks
  BOOKMARKS_FILE = '~/Library/Application Support/Google/Chrome/Default/Bookmarks'

  def self.list
    print_bookmarks(CLI.new.list)
  end

  def self.open(id)
    CLI.new(id: id).open
  end

  def self.search(query)
    print_bookmarks(CLI.new(query: query).search)
  end

  def self.print_bookmarks(bookmarks)
    bookmarks.each do |bookmark|
      puts "##{bookmark['id']}: #{bookmark['name']}"
    end
  end
end
