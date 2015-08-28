require_relative './tile.rb'
require 'byebug'

class Board
BOMB_NUM = 10
  def initialize
    @board = Array.new(9) {Array.new(9)}
    populate
    insert_bombs
  end

  attr_reader :board

  def populate
    @board.each_with_index do |row, row_pos|
      row.each_with_index do |col, col_pos|
        self[row_pos, col_pos] = Tile.new(self, [row_pos, col_pos])
      end
    end
  end

  def insert_bombs
    possible_spaces = (0..8).to_a
    inserted_bombs = 0

    while inserted_bombs < BOMB_NUM
      random_row = possible_spaces.sample
      random_col = possible_spaces.sample

      current_tile = self[random_row, random_col]
      if current_tile.bombed
        next
      else
        current_tile.bombed = true
        inserted_bombs += 1
      end
    end
  end

  def [](row, col)
    @board[row][col]
  end

  def []=(row, col, val)
    @board[row][col] = val
  end
end
