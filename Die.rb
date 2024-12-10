# This Ruby class represents a die with a specified number of sides and has a method to roll the die
# and return a random number between 1 and the number of sides.
class Die
    def initialize(sides)
      @sides = sides
    end
  
    def roll
      rand(1..@sides)
    end
  end
  