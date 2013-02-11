module FixtureHelpers
  def load_bookmarks
    JSON.parse(File.read('spec/fixtures/bookmarks.json'))
  end
end
