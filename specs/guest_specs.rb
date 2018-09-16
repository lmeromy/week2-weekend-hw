require("minitest/autorun")
require("minitest/rg")
require_relative("../guest")
require_relative("../song")

class GuestTest < Minitest::Test

  def setup
    song = Song.new("Somebody to Love", "Queen")
    @guest = Guest.new("Leah", 20, song)
  end

  def test_can_get_name
    assert_equal("Leah", @guest.name)
  end

  def test_can_get_guest_favorite_song
    assert_equal("Somebody to Love", @guest.fave_song.title())
  end

  def test_can_get_wallet_balance
    assert_equal(20, @guest.wallet)
  end

  def test_can_spend_money
    result = @guest.spend_money(5)
    assert_equal(15, result)
  end

  def test_fave_song
    result = @guest.favorite_song()
    assert_equal("Oh man, I LOVE this song!", result)
  end

end
