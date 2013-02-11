require 'json'

module Chromarks
  class CLI
    def initialize(options = {})
      @options = options
      parse_bookmarks
      sort_bookmarks
    end

    def open
      system("open '#{find(@options[:id])['url']}'")
    end

    def search
      bookmarks.collect do |bookmark|
        bookmark if bookmark['name'] =~ /#{@options[:query]}/i
      end.compact
    end

    def bookmarks
      @bookmarks ||= Array.new
    end

    private

    def find(id)
      bookmarks.select { |bookmark| bookmark['id'] == id }.first
    end

    def parse_bookmarks
      bookmarks_json.each do |node|
        scan_node(node)
      end
    end

    def sort_bookmarks
      bookmarks.sort! { |first,second| first['id'] <=> second['id'] }
    end

    def scan_node(node)
      if node['type'] == 'url'
        bookmarks << node_to_bookmark(node)
      elsif node['type'] == 'folder'
        node['children'].each { |node| scan_node(node) }
      end
    end

    def node_to_bookmark(node)
      {
        'id' => node['id'].to_i,
        'name' => node['name'],
        'url' => node['url']
      }
    end

    def bookmarks_json
      json = JSON.parse(File.read(bookmarks_file))['roots']
      result = json['bookmark_bar']['children']
      result << json['other']

      result
    end

    def bookmarks_file
      File.expand_path(BOOKMARKS_FILE)
    end
  end
end
