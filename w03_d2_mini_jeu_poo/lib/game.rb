require 'pry'

class Game
  attr_accessor :human_player, :enemies_in_sight, :players_left

  def initialize(name)
    @human_player = HumanPlayer.new(name)
    @players_left = 1 #Nb de joueurs(ennemis) restants à tuer dans le jeu pour gagner
    @enemies_in_sight = Array.new #ennemis en vue, voir la méthode new_players_in_sight
  end

  def new_players_in_sight #donne des nouveaux ennemis à combattre
    if @enemies_in_sight.length == @players_left 
      puts "\n\e[93mTous les joueurs sont en vue ! Il serait temps que tu les attaque !\e[0m\n"
    else
      new_enemy = rand(1..6)
        if new_enemy == 1
          puts "\n\e[93mOh bah mince... pas de nouvel ennemi pour toi... T'as vraiment de la chance !\e[0m\n"
            elsif new_enemy.between?(2,4) || (new_enemy >= 5 && @players_left == 1)
              names_array = ["Batman", "Robin", "Deadpool", "Francis", "Catwoman", "Terminator", "Bob l'éponge", "Eragon", "Harry Potter", "Hermione"]
              player_attacked = "#{names_array.sample(1).join("")}_#{rand(00..99)}"
                @enemies_in_sight << player_attacked = Player.new(player_attacked)
                puts "\n\e[94mLe joueur #{player_attacked.name} vient d'entrer en jeu ! Good Luck\e[0m\n"
              elsif new_enemy >= 5
                2.times do
                names_array = ["Batman", "Robin", "Dedapool", "Francis", "Catwoman", "Terminator", "Bob l'éponge", "Eragon", "Harry Potter", "Hermione"]
                player_attacked = "#{names_array.sample(1).join("")}_#{rand(00..99)}"
                  @enemies_in_sight << player_attacked = Player.new(player_attacked)
                  puts "\n\e[94mLe joueur #{player_attacked.name} vient d'entrer en jeu ! Good Luck\e[0m\n"
                end #end du do
        end #end du if
    end #end du if 1
  end #end de la def

  def kill_player(enemy_killed) #supprime un player de l'array des ennemis quand on l'a tué
    @enemies_in_sight.each do |enemy|
      if enemy == enemy_killed
        @enemies_in_sight.delete(enemy)
        @players_left = @players_left - 1
        puts " "
      end
    end
    puts "Il te reste #{@players_left} ennemis à tuer"
  end

  def is_still_ongoing? #vérifie qu'on est bien vivant ou qu'il reste des ennemis
    (@human_player.life_points > 0 && @players_left != 0)? true : false
  end

  def show_players #montre l'état du joueur et des ennemis
    puts "\e[45m              ?? Alors, on en est où ??              \e[0m\n"
    print "> "
    puts "#{@human_player.show_state}"
    puts "> Et il te reste : #{@players_left} ennemi(s) à battre"
  end

  def menu
    puts "\n\e[5;96m Quelle action veux-tu effectuer ? \e[25m \n\n"
    puts "a - Chercher une meilleure arme"
    puts "b - Chercher à se soigner \n\n"
    if @enemies_in_sight.length != 0
    puts "Attaquer un joueur en vue :"
    end
    n=0
    @enemies_in_sight.each do |enemy| #affiche tous les ennemis qu'on peut attaquer (qui sont visibles)
      print "#{n+1} - "
        puts enemy.show_state
      n+=1
    end
    print "\n>> \e[0m"
  end

  def menu_choice(choice)
    if choice != "a" && choice != "b" #il faut modifier le chiffre en integer pour le comparer au numéro du bot
      choice = choice.to_i
    end

    if choice == "a"
      @human_player.search_weapon
        elsif choice == "b"
          @human_player.search_health_pack
            elsif choice.between?(1,@enemies_in_sight.length) == true
              choice = choice - 1 #parce que quand je tape 1, ça prends en compte 2..
              @human_player.attacks(@enemies_in_sight[choice])
                if @enemies_in_sight[choice].life_points == 0
                  kill_player(@enemies_in_sight[choice])
                end
                  else
                    puts "Désolée mais ton choix n'existe pas, tu perds 1 tour ! #loser"
    end
  end

  def enemies_attack
    if @enemies_in_sight.length != 0
    puts "\e[91m\e[1mLes autres joueurs t'attaquent \e[0m \n\n"
    end

    @enemies_in_sight.each do |enemy| #boucle d'attaques des ennemis, sauf s'ils sont morts
      if enemy.life_points > 0
        enemy.attacks(@human_player)
      end
    end
  end


  def end_of_game
    if @human_player.life_points > 0 && @players_left == 0
      puts "\n \e[32m   ---------- FELICITATIONS !!!! Tu as gagné ----------\e[0m \n\n\n\n\n"
    else
      puts "\n \e[91m   ----- POOOOAH ! T'es trop une grosse merde, t'as perdu ! Mouahaha -----\e[0m \n\n\n\n\n"
    end
  end

end #fin de la classe Game