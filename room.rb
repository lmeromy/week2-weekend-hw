require("pry")

class Room

  attr_reader :room_name, :capacity

  attr_accessor :guests, :playlist, :till

  def initialize(room_name, guests, playlist, capacity)
    @room_name = room_name
    @guests = []
    @playlist = []
    @capacity = capacity
    @fee = 5
    @till = 0
  end

  def checkin(guest)
    if @guests.length() < @capacity
      guest.spend_money(@fee)
      @guests << guest
      @till += @fee
      #binding.pry
    else
      return "I'm sorry, this room is full :(. Try a different room!"
    #binding.pry
    end
  end

  def checkout(guest)
    @guests.delete(guest)
  end

  def add_song(song)
    @playlist << song
  end

  def play_song(guest, song)
      if guest.fave_song.title() == song.title()
        return "#{guest.name()}: #{guest.favorite_song()}"
      else
        return "Saweeet! #{guest.name()} is gonna sing '#{song.title()}' by #{song.artist()}!"
      end
  end



  ### Extensions Completed #####

  # limit number of guests in room
  # impose fee on guests, guests pay the fee,
  # Room till increases by fee
  # when favorite song is played, guest reacts




end
