require 'bundler'
Bundler.require

require_relative 'lib/views/board'
require_relative 'lib/views/boardcase'
require_relative 'lib/app/game'
require_relative 'lib/app/player'

puts "*" * 51
puts "\n   BIENVENUE DANS NOTRE SUPER JEU DE MORPION !!!\n\n"
puts "*" * 51

my_morpion = Game.new
my_morpion.ask_name
my_morpion.turn
my_morpion.game_end
my_morpion.new_round
