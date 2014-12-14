require 'spec_helper'

describe Chromarks::CLI do
  before(:each) do
    stub_const("Chromarks::BOOKMARKS_FILE", 'spec/fixtures/bookmarks.json')
  end

  describe '#new' do
    let(:cli) { Chromarks::CLI.new }

    it 'parses bookmarks' do
      expect(cli.bookmarks.size).to eq(3)
    end
  end

  describe '#search' do
    let(:cli) { Chromarks::CLI.new(query: 'clean') }
    let(:results) { cli.search }

    it 'returns matches for a given keyword' do
      expect(results.first['name']).to eq('Clean Coders')
      expect(results.size).to eq(1)
    end
  end

  describe '#open' do
    let(:cli) { Chromarks::CLI.new(id: 476) }
    let(:expected_url) { 'http://wireframe.cc/' }

    it 'finds and opens a bookmark' do
      expect(cli).to receive(:system).with("open '#{expected_url}'")
      cli.open
    end
  end
end

