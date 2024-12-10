# The `AutoDropDead` class is designed to automate the playing of a game called DropDead by creating
# an instance of `DropDeadGame` and playing rounds until the game is over.
require_relative 'load_drop_dead'

class AutoDropDead
    def play_game(sides, dice_count, player_count)
      game = DropDeadGame.new(sides, dice_count, player_count)
  
      until game.game_over
        game.play_round
      end
  
    end
  end 

