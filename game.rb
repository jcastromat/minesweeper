require_relative './board.rb'
require_relative './tile.rb'

class Game

  def initialize
    @game_board =  Board.new
    @game_over = false
  end

  def play
    until @game_board.won?
      puts "Enter r for reveal or f for flag, followed by coordinates"
      # input is r, 2, 4
      guess = gets.chomp.split(", ")
      action = guess[0]
      position = guess[1..2]
      tile_check(action, position)
      render
      # recieve game over from tile check, or renders board
      # not done yet
    end
  end


  def tile_check(action, position)
    if action == "r"
      if @game_board[position].bombed
        @game_over = true
      else
        @game_board[position].reavealed = true
      end
    else
      @game_board[position].flagged = true
    end
  end


  #tile methods:
  # need method for finding neighbors
  # need method for counting bombs per neighbor





end
