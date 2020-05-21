#Correction du w01_d4 directement dans le cours

#Pour le problème "lancer un dé virtuel", ma méthode n'aura pas d'entrée et retournera en sortie un chiffre entre 1 et 6.
def roll_dice
  return rand(6)+1
end

#Pour analyser le lancé, je vais écrire une méthode qui prend en entrée un lancé de dé (chiffre entre 1 et 6)
#et retourne en sortie le nombre de case à faire (+1 pour avancer, -1 pour reculer, sinon 0 pour ne pas bouger).
#C'est une méthode avec un gros if en fait ! Je mets des puts pour mieux informer le joueur de ce qu'il se passe.
def analyze_dice(dice)
  if dice >=5
    puts "Vous avancez!"
    return 1
  elsif dice == 1
    puts "Vous reculez!"
    return -1
  else
    puts "rien ne se passe"
    return 0
  end
end

#Pour afficher un état des lieux, il suffit qu'une méthode prenne en entrée un numéro de case et affiche un message correspondant.
#Encore une fois c'est assez simple :
def show_state(num)
  puts "Vous êtes sur la marche n° #{num}"
end

#Pour vérifier si la partie doit se finir, je dois à nouveau avoir en entrée un numéro de case et en sortie,
#je choisis de mettre un booléen où true signifiera "il a gagné !". On est encore sur un gros if.
def is_over?(num)
  if num == 10
    return true
  else
    return false
  end
end

def play
  puts "Bienvenue dans le jeu!!"

  step = 1
  show_state(step)

  while(!is_over?(step)) do
    puts "tapez 'entrée' pour jouer"
    gets.chomp
    step += analyze_dice(roll_dice)
    show_state(step)
  end

  puts "===Vous avez gagné!==="
end

play