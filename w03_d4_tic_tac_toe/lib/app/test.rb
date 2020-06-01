def turn(player)
  #Elle affiche le plateau, tant qu'il n'y a pas de defaite 
  if @board.victory? == false
    # on circule dans l'array des players et c'est current_player qui joue
    @board.show_board
    @current_player = player
      #demande au joueur ce qu'il joue
      play_turn(@current_player)
      #passe au joueur suivant si la partie n'est pas finie.
      @number_of_turn += 1
       }
   end 
end