require("minitest/autorun")
require("minitest/rg")
require_relative("../song")
require_relative("../guest")
require_relative("../room")

class RoomTest < Minitest::Test
  def setup
    song1 = Song.new("Somebody to Love", "Queen")
    song2 = Song.new("Raise Hell", "Brandi Carlile")
    song3 = Song.new("Scar Tissue", "Red Hot Chili Peppers")
    song4 = Song.new("Hurricane", "Hamilton Broadway Soundtrack")

    @guest1 = Guest.new("Leah", 20, song1)
    @guest2 = Guest.new("Dani", 35, song2)
    @guest3 = Guest.new("Eliz", 40, song3)
    @guest4 = Guest.new("Alex", 1000, song4)

    playlist = []
    guests = []

    @room = Room.new("Room1", guests, playlist, 3)
  end

  def test_can_get_room_name
    assert_equal("Room1", @room.room_name())
  end

  def test_has_capacity
    assert_equal(3, @room.capacity)
  end

  def test_checkin_guest
    @room.checkin(@guest1)
    @room.checkin(@guest2)
    assert_equal(2, @room.guests.length())
  end

  def test_guest_type
    @room.checkin(@guest1)
    assert_equal("Leah", @room.guests[0].name)
    assert_equal(15, @room.guests[0].wallet)
    assert_equal(Song, @room.guests[0].fave_song.class())
  end

  def test_guest_checkin_at_capacity
    @room.checkin(@guest1)
    @room.checkin(@guest2)
    @room.checkin(@guest3)
    assert_equal("I'm sorry, this room is full :(. Try a different room!", @room.checkin(@guest4))
    assert_equal(3, @room.guests.length())
  end

  def test_checkout__specific_guest
    @room.checkin(@guest1)
    @room.checkin(@guest2)
    @room.checkout(@guest1)
    assert_equal(1, @room.guests.length())
    assert_equal("Dani", @room.guests[0].name)
  end

  def test_add_song_to_playlist
    song5 = Song.new("8 days a week", "The Beatles")
    @room.add_song(song5)
    assert_equal(1, @room.playlist.length())
    assert_equal("8 days a week", @room.playlist[0].title)
  end

  def test_charge_fee
    @room.checkin(@guest4)
    assert_equal(995, @room.guests[0].wallet())
    assert_equal(5, @room.till())

  end

  def test_play_song
    song2 = Song.new("Raise Hell", "Brandi Carlile")
    result = @room.play_song(@guest1, song2)
    assert_equal("Saweeet! Leah is gonna sing 'Raise Hell' by Brandi Carlile!", result)
  end

  def test_play_song_favorite
    song4 = Song.new("Hurricane", "Hamilton Broadway Soundtrack")
    result = @room.play_song(@guest4, song4)
    assert_equal("Alex: Oh man, I LOVE this song!", result)
  end




end
