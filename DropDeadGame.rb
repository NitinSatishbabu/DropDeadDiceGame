# The `DropDeadGame` class represents a game where players roll dice and score points based on the
# rolls, with the game ending when all players have no dice left.
require_relative 'load_drop_dead'

class DropDeadGame
    attr_reader :players, :dice_count, :sides
  
# The initialize method sets up a game with a specified number of sides on the dice, dice count, and
# player count, creating player objects accordingly.
    def initialize(sides, dice_count, player_count)
      @sides = [sides, 6].max
      @dice_count = [dice_count, 2].max
      puts "Initialized game with #{@sides} sides and #{@dice_count} dice."
      @players = Array.new(player_count) do |i|
        Player.new("Player #{i + 1}", @dice_count, @sides)
      end
      @final_scores_hash = {}
    end
  
    ##
    # This Ruby function simulates a round of a game where players roll dice, score points based on
    # the rolls, and are eliminated if they roll certain numbers.
    def play_round
        @players.each do |player|
          rolls = player.roll_dice
      
          if rolls.any? { |r| [2, 5].include?(r) }
            puts "#{player.name} scored 0 points. Rolled: #{rolls.inspect}."
            player.remove_dead_dice(rolls)
          else
            player.calculate_points(rolls)
            puts "#{player.name} rolled: #{rolls.inspect}. Current score: #{player.score}."
          end

          @final_scores_hash[player.name] = player.score

          if !player.any_remaining_dice
            player.out = true
            puts "#{player.name} has no dice left. ----- Final score for #{player.name} = #{player.score} -----"
          end
        end
        @players.reject!(&:out)
      end

  
# The `roll_dice` function in Ruby adds a specified number of dice to a player and then rolls each
# die.
    def roll_dice(player)
      player.add_dice(Array.new(@dice_count) { Dice.new(@sides) })
      player.dice.map{|die| die.roll}
    end
  
##
# The `game_over` function checks if all players are out and announces the winner with the highest
# score before exiting the game.
    def game_over
      if @players.all?(&:out)
        winner = @final_scores_hash.max_by { |_, score| score }
        puts "The winner is #{winner[0]}! Total score: #{winner[1]}"
        exit
      end
    end
  end