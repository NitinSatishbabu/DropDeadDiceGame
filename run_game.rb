# This Ruby script is setting up a command-line interface for a game.
require_relative 'load_drop_dead'

if ARGV.length != 3
    puts "ruby AutoDropDead.rb sides dice_count player_count"
    exit 1
  end
  
  sides = ARGV[0].to_i
  dice_count = ARGV[1].to_i
  player_count = ARGV[2].to_i
  
  AutoDropDead.new.play_game(sides, dice_count, player_count)