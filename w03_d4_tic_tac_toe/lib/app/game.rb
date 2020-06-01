class Game
  ######## les fonctions sont ecrites dans l'ordre ou on les appelle dans une partie normale #########
  #DONE : la classe a plusieurs attr_accessor: 
  #le current_player (égal à un objet Player), 
  #le status (en cours, nul ou un objet Player s'il gagne), 
  #le Board et un array contenant les 2 joueurs.
  attr_accessor :current_player, :status, :board, :players, :number_of_turn

  def initialize
    #DONE : créé un array vide de joueurs, créé un board 
    #TO-DO :met le status à "on going", défini un current_player
    @players = []
    @board = Board.new
    @current_player = current_player
    @number_of_turn = 0
  end

  def ask_name
    # demande leur nom au joueur et leur attribut un symbole
    puts "\n Quel est ton nom, cher premier joueur ?"
    print "> "
    player1_name = gets.chomp
    player1 = Player.new(player1_name, "X")
    @players << player1  
    #idem pour le joueur 2
    puts "\n Et toi mon petit deuxième joueur ?"
    print "> "
    player2_name = gets.chomp
    player2 = Player.new(player2_name, "O")
    @players << player2    
  end


  def turn
    #Elle affiche le plateau, tant qu'il n'y a pas de defaite 
    
    until @board.victory? == true
      # on circule dans l'array des players et c'est current_player qui joue
      @players.each { |player| 
        @board.show_board
        
        @current_player = player
        #demande au joueur ce qu'il joue
        play_turn(@current_player)
        #passe au joueur suivant si la partie n'est pas finie.
        @number_of_turn += 1
         }
     end 
  end


  def play_turn(player)
  # demande au joueur ce qu'il souhaite faire
        puts "C'est à ton tour #{player.name}. Tu as le symbole '#{player.symbol}' => entre la case que tu souhaites jouer (A1, B3, C1, etc)"
      print "> "
      case_choosen = gets.chomp    #DONE: change la BoardCase jouée en fonction de la valeur du joueur (X ou O)
      @board.write_case(case_choosen, player.symbol)
  end



  def new_round
    # TO DO : relance une partie en initialisant un nouveau board mais en gardant les mêmes joueurs.
    puts "\nUne nouvelle partie, ça vous tente ?"
    puts "Si oui : mets 1, sinon mets n'importe quoi !"
    print "> "
    round_choice = gets.chomp.to_i

    if round_choice == 1
      puts "\nC'est reparti pour un tour !!!"
      @board = Board.new
      turn
      game_end
      new_round
    else 
      puts "\nTHE END !"
    end
  end

  def game_end
  # permet l'affichage de fin de partie quand un vainqueur est détecté ou si il y a match nul
    if @number_of_turn == 10
      puts "\nMatch nul ! Vous êtes des gros nazes !!!"
    else
      puts "\n#{@current_player.name} a gagné !!! T'es un champion !"
    end
  end

end