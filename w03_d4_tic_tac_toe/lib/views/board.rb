class Board
  attr_accessor  :board_array, :board_winning

  def initialize
    #Quand la classe s'initialise, elle doit créer 9 instances BoardCases
    @A1 = BoardCase.new("A1", " ")
    @A2 = BoardCase.new("A2", " ")
    @A3 = BoardCase.new("A3", " ")
    @B1 = BoardCase.new("B1", " ")
    @B2 = BoardCase.new("B2", " ")
    @B3 = BoardCase.new("B3", " ")
    @C1 = BoardCase.new("C1", " ")
    @C2 = BoardCase.new("C2", " ")
    @C3 = BoardCase.new("C3", " ")
    #Ces instances sont rangées dans un array/hash qui est l'attr_accessor de la classe
    @board_array = [@A1, @A2, @A3, @B1, @B2, @B3, @C1, @C2, @C3]
    @board_winning = Array.new
  end


  def show_board
    # Affiche un tableau 
    puts "    \e[31m1   2   3\e[39m  "
    puts " \e[31mA\e[39m  #{@A1.content} | #{@A2.content} | #{@A3.content}"
    puts "   -----------"
    puts " \e[31mB\e[39m  #{@B1.content} | #{@B2.content} | #{@B3.content}"
    puts "   -----------"
    puts " \e[31mC\e[39m  #{@C1.content} | #{@C2.content} | #{@C3.content}\n\n"

  end

  #fonction pour ecrire dans une case suite au choix du joueur, elle parcourt board_array, et change la valeur au symbole du joueur une fois sur la bonne case
  def write_case(case_choosen, current_player_symbol)
    @board_array.each do |tartenpion| 
      if case_choosen == tartenpion.case_number && tartenpion.content == " "
      tartenpion.content = current_player_symbol
      elsif case_choosen == tartenpion.case_number && tartenpion.content != " "
        puts "La case est pleine ! Tant pis pour toi ! Tu perds 1 tour"
      end
    end
  end
  
  def victory?
    x_victory = ["X","X","X"]
    o_victory = ["O","O","O"]
      
    @board_winning = [
    [@A1.content, @A2.content, @A3.content],
    [@B1.content, @B2.content, @B3.content],
    [@C1.content, @C2.content, @C3.content],
    [@A1.content, @B1.content, @C1.content],
    [@A2.content, @B2.content, @C2.content],
    [@A3.content, @B3.content, @C3.content],
    [@A1.content, @B2.content, @C3.content],
    [@A3.content, @B2.content, @C1.content]]

    @board_winning.each do |champignon|
      #on teste chaque ligne, colonne et diagonale pour verifier si il y a 3 X ou 3 O, victoire si oui, 
      if champignon == x_victory || champignon == o_victory
        return true
      end
    end
  end
  

end



