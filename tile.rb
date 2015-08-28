class Tile

  def initialize(board, position)
    @position = position
    @board = board
    @bombed = false
    @flagged = false
    @revealed = false
  end

  attr_accessor :bombed, :flagged, :revealed, :position

  def neighbors(board)
    
  end

  def neighbors_bomb_count
  end

  def inspect
    return "Position: #{self.position}, bombed: #{self.bombed}, flagged: #{self.flagged}, revealed: #{self.revealed}"
    #return a string that contains tiles pos, bombed, flagged, revealed
  end

end
