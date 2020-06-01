require 'pry'

class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state #montre l'état de vie du joueur sélectionné (ex : player1.show_state)
    if @life_points <= 0
      print "#{@name} a 0 point de vie"
        elsif @life_points == 1
          print "#{@name} a #{@life_points} point de vie"
            else
              print "#{@name} a #{@life_points} points de vie"
    end
  end

  def gets_damage(damage) #inflige des dommages au joueur
    @life_points = @life_points - damage #on peut écrire -= damage pour aller plus vite
    if @life_points <= 0
      puts "\n - Le joueur #{@name} a été tué !! -"
    end
  end

  def attacks(player_attacked) #Faire subir une attaque à player_attacked
    puts "\e[31m## #{@name} attaque #{player_attacked.name}\e[0m"
    damage = compute_damage #reprends la méthode en dessous qui donne des coups aléatoirement
      if damage == 1
        puts "\e[31m      #{@name} lui inflige #{damage} point de dommages !!\e[0m"
      else
        puts "\e[31m      #{@name} lui inflige #{damage} points de dommages !!\e[0m"
      end
    player_attacked.gets_damage(damage)
  end

  def compute_damage #méthode qui donne des damages aléatoirement entre 1 et 6
#on crée une méthode à part, qu'on aurait pu mettre dans attacks, pour pouvoir la modifier dans HumanPlayer
    return rand(1..6)
  end
end #fin de la classe Player

class HumanPlayer < Player #VERSION 2.0 : normalement faudrait créer un nv fichier mais exceptionnellement on le fait pas, c'est un petit programme donc ça passe
  attr_accessor :weapon_level

  def initialize(name) #on modifie les points de vie et on rajoute une arme, par contre le nom reste le même
    super(name)
    @life_points = 100
    @weapon_level = 1
  end

  def show_state #montre l'état de vie du joueur sélectionné (ex : player1.show_state)
    if @life_points <= 1
      puts "#{@name} a #{@life_points} point de vie et une arme de niveau #{weapon_level}"
    else
      puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{weapon_level}"
    end
  end
  
  def compute_damage #méthode qui donne des damages aléatoirement entre 1 et 6 et qui multiplie le résultat à la force de l'arme
    return rand(1..6) * @weapon_level
  end

  def search_weapon
    new_weapon = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon}"
    if new_weapon > @weapon_level
      puts "Wahou ! Mais cette arme est carrément plus puissante, vas-y garde-la wesh !!"
      @weapon_level = new_weapon
    else
      puts "M@$#-*... Elle n'est pas meilleure... Vas-y jette-la !!"
    end
  end

  def search_health_pack
    health_pack = rand(1..6)
    if health_pack == 1
      puts "Désolée gros, tu n'as rien trouvé..."
        elsif health_pack.between?(2, 5)
          puts "Bravo, tu as trouvé un pack de +50 PV !"
            if @life_points + 50 > 100
              @life_points = 100
            else
              @life_points = @life_points + 50
            end
        else
          puts "Wow ! T'as trouvé un pack de +80 PV, t'es un génie !!"
            if @life_points + 80 > 100
              @life_points = 100
            else
              @life_points = @life_points + 80
            end
    end
  end
end #fin de la class HumanPlayer