require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

  puts "\n\e[104;90m-----------------------------------------------------------------"
  puts "|        Bienvenue dans ce nouveau jeu trop génialissime        |"
  puts "|                   ILS VEULENT TOUS MA POO !                   |"
  puts "|        Le but du jeu est d'être le dernier survivant !        |"
  puts "-----------------------------------------------------------------\e[0m\n\n"

#création du joueur(user)
  puts "\e[4mAfin de commencer, dis-moi ton nom, cher combattant :\e[24m"
  print "> "
  name_player = gets.chomp
  puts "\n      Enchantée, #{name_player}\n\n"
  user = HumanPlayer.new(name_player)
  puts "\e[3mC'est bon, ton perso est créé ! Tu vas pouvoir commencer à combattre : \e[0m \n"
  puts user.show_state

#création des ennemies
  enemies_array = Array.new #crée un array d'ennemies, plus facile à manipuler quand il y en a bcp
  player1 = Player.new("Josiane")
  player2 = Player.new("José")
  enemies_array = [player1, player2]
  puts "Je te présente tes nouveaux ennemies : #{player1.name} et #{player2.name}"
  puts "\e[3mAppuie sur entrer pour voir la suite\e[0m"
  gets.chomp #pour aérer l'affichage du jeu


  while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
    puts "-----------------------------------------------------------\n\n"
    puts "\e[34m #{user.show_state}"
    puts "****** \n\n"
    #menu
      puts "\e[5m Quelle action veux-tu effectuer ? \e[25m \n\n"
      puts "a - Chercher une meilleure arme"
      puts "b - Chercher à se soigner \n\n"
      puts "Attaquer un joueur en vue :"
      print "0 = "
      print "#{player1.show_state}"
      print "1 = "
      print "#{player2.show_state} \n"
      print ">> \e[0m"
      choice = gets.chomp

      if choice == "a"
        user.search_weapon
        elsif choice == "b"
          user.search_health_pack
          elsif choice == "0"
            user.attacks(player1)
            elsif choice == "1"
              user.attacks(player2)
              else
                puts "Désolée mais ton choix n'existe pas, tu perds 1 tour ! #loser"
      end
    
    puts "----------------------------------------------------------- \n\n"
    
    if player1.life_points > 0 || player2.life_points >0
      puts "\e[91m\e[1mLes autres joueurs t'attaquent \e[0m \n\n"
    end

    enemies_array.each do |enemy| #boucle d'attaques des ennemies, sauf s'ils sont morts
      if enemy.life_points > 0
        enemy.attacks(user)
      end
    end
    puts "\e[3mAppuie sur entrer pour voir la suite\e[0m"
    gets.chomp #pour aérer l'affichage du jeu
  end
  
  if user.life_points > 0 && player1.life_points <= 0 && player2.life_points <=0 #dès qu'on sort de la boucle while, on a soit gagné, soit perdu
    puts "\n \e[32m   ---------- FELICITATIONS !!!! Tu as gagné ----------\e[0m \n\n\n\n\n"
  else
    puts "\n \e[91m   ----- POOOOAH ! T'es trop une grosse merde, t'as perdu ! Mouahaha -----\e[0m \n\n\n\n\n"
  end

#binding.pry