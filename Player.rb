# The `Player` class represents a player in a dice game, allowing them to roll dice, remove certain
# rolls, calculate points, and keep track of their score.
require_relative 'load_drop_dead'

class Player
    attr_reader :dice, :score
    attr_accessor :out
  

# This Ruby function initializes a player with a specified name, number of dice, sides on each die,
# score, and status.
    def initialize(name, dice_count, sides)
      @nameofplayer = name
      @dice = Array.new(dice_count) { Die.new(sides) }
      @score = 0
      @out = false
    end

    def name  
        @nameofplayer
    end
  
    def roll_dice
      @dice.map{|die| die.roll}
    end
  
# The `remove_dead_dice` method removes dice from the `@dice` array based on the values in the `rolls`
# array at corresponding indices 2 and 5.
    def remove_dead_dice(rolls)
        @dice.delete_if.with_index {|_, index| [2, 5].include?(rolls[index])}
    end
  

# The `calculate_points` function in Ruby calculates the total points scored from a given array of
# rolls, with a condition to return 0 points if any roll is a 2 or 5.
    def calculate_points(rolls)
        if rolls.any? { |roll| [2, 5].include?(roll) }
            puts "No points scored"
            return 0
        else
            points = rolls.sum
            @score += points
            return points
        end
    end
  
# The `any_remaining_dice` function in Ruby checks if there are any dice remaining in the `@dice`
# array.
    def any_remaining_dice
      !@dice.empty?
    end
  

    def total_score
      @score
    end
  end