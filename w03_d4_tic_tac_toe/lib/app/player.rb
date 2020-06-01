class Player
   attr_reader :name, :symbol
  
    def initialize(name_to_save, symbol_to_save)
      @name = name_to_save
      @symbol = symbol_to_save
    end

    def display_names 
      puts "Le nom du joueur 1 est #{@players[0].name} et son symbole est #{@players[0].symbol}"
      puts "Le nom du joueur 2 est #{@players[1].name} et son symbole est #{@players[1].symbol}"
    end

end