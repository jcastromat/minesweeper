require 'byebug'
require_relative './board.rb'

class Tile

  POSITIONS = [[-1,1], [-1,0], [-1,-1], [0,1], [1,1], [1,0], [1,-1], [0,-1]]

  def initialize(board, position)
    @position = position
    @board = board
    @bombed = false
    @flagged = false
    @revealed = false
  end

  attr_accessor :bombed, :flagged, :revealed, :position, :fringe

  def neighbors
    #debugger
    neighbors_positions = POSITIONS.map do |pos|
      x,y = pos
      [@position.first + x, @position.last + y]
    end

    neighbors_positions.select! do |pos|
      x,y = pos
      ((x >= 0) && (x < 9)) && ((y >= 0) && (y < 9))
    end

    neighbors_positions.map do |pos|
      x, y = pos
      @board[x, y]
    end
  end

  def revealed=(val)
    return if revealed
    @revealed = val
    if neighbors_bomb_count.zero?
      neighbors.each { |tile| tile.revealed = true }
    end
    # IF no neighbors are bombed,
    # reveal all neighbors
  end

  def to_s
    if (self.revealed) && (self.neighbors_bomb_count > 0)
      "| #{neighbors_bomb_count} |"
    elsif self.revealed
      "| r |"
    elsif self.flagged
      "| f |"
    else
      "| * |"
    end
  end
  #
  # def fringe_finder
  #   fringe = [self]
  #
  #     until fringe.empty?
  #       if self.neighbors_bomb_count(self.neighbors) > 0
  #         # fringe << self unless self.revealed
  #         self.revealed = true
  #         break
  #
  #       else
  #         fringe << self.neighbors
  #         tile = fringe.shift
  #         #debugger
  #         tile.fringe_finder unless tile.revealed
  #       end
  #     end
  # end


  def neighbors_bomb_count
    counter = 0
    neighbors.each do |el|
        counter += 1 if el.bombed
    end
    counter
  end

  def inspect
    return "Position: #{self.position}, bombed: #{self.bombed}, flagged: #{self.flagged}, revealed: #{self.revealed}"
    #return a string that contains tiles pos, bombed, flagged, revealed
  end


end
