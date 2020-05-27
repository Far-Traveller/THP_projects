require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

  puts "\n\e[104;90m-----------------------------------------------------------------"
  puts "|        Bienvenue dans ce nouveau jeu trop génialissime        |"
  puts "|                   ILS VEULENT TOUS MA POO !                   |"
  puts "|        Le but du jeu est d'être le dernier survivant !        |"
  puts "-----------------------------------------------------------------\e[0m\n\n"

  puts "\e[4mAfin de commencer, dis-moi ton nom, cher combattant :\e[24m"
  print "> "
  name_player = gets.chomp
  puts "\n      Enchantée, #{name_player}\n\n"
  
  my_game = Game.new(name_player) #on initialise le jeu
  puts "\e[1mC'est bon, ton perso est créé ! Tu vas pouvoir commencer à combattre\e[0m \n"
  print "\n\e[3;37mAppuie sur entrée pour continuer\e[0m"
    gets.chomp
  
  while my_game.is_still_ongoing? == true #vérifie si le jeu continue
    puts "\n-----------------------------------------------------"
    my_game.new_players_in_sight #pour ajouter des adversaires
      print "\n\e[3;37mAppuie sur entrée pour continuer\e[0m"
        gets.chomp
    puts "\n-----------------------------------------------------\n"
    my_game.menu
    choice = gets.chomp
    my_game.menu_choice(choice)
    puts "\n-----------------------------------------------------\n"
    my_game.enemies_attack
      print "\n\e[3;37mAppuie sur entrée pour continuer\e[0m"
        gets.chomp
    puts "\n-----------------------------------------------------\n"
    my_game.show_players
      print "\n\e[3;37mAppuie sur entrée pour continuer\e[0m"
        gets.chomp
  end

  my_game.end_of_game

binding.pry

