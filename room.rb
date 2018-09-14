require("pry")

class Room

  attr_reader :room_name, :capacity

  attr_accessor :guests, :playlist

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

  def play_song(song)
    return "Saweeet! Who's gonna sing '#{song.title()}' by #{song.artist()}?!?!"
    #### must test this! maybe need to create a separate function!?
    for guest in @guests
      if song.title() == guest.fave_song()
        p "#{guest.name()}: #{guest.favorite_song()}"
      end
    end
  end



  ### Extensions Completed #####

  # limit number of guests in room
  # impose fee on guests, guests pay the fee
  # almost....when favorite song is played, guest says Yay, etc!




end
