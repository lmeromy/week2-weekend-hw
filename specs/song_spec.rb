require("minitest/autorun")
require("minitest/rg")
require_relative("../song")

class SongTest < Minitest::Test

  def setup
    @song = Song.new("Raise Hell", "Brandi Carlile")
  end

  def test_can_get_song_title
    assert_equal("Raise Hell", @song.title)
  end

end
