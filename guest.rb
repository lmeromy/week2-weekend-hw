class Guest
  attr_reader :name, :fave_song
  attr_accessor :wallet

  def initialize(name, wallet, fave_song)
    @name = name
    @wallet = wallet
    @fave_song = fave_song
  end

  def spend_money(amount)
    @wallet -= amount
    #return @wallet #(necessary to return?)
  end

  # undecided: might want this method in room class?
  def favorite_song()
    return "Oh man, I LOVE this song!"
  end


end
