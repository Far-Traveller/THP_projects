#Correction du w01_d4 directement dans le cours

#Pour le problème "demander le nombre d'étage", c'est assez simple : aucune entrée, et en sortie,
# la méthode doit retourner la saisie de l'utilisateur.
# Mes tests ultérieurs me montreront que j'ai un bug si je ne mets pas ce retour sous forme d'integer (gets.chomp retourne un string)
#donc j'applique un petit to_i.
def ask_floor
  puts "Salut, bienvenue dans ma super pyramide ! Combien d'étages veux-tu ?"
  print "> "
  return gets.chomp.to_i
end

#Pour le problème "afficher un étage donné", il faut passer plus de temps.
#Après quelques essais sur des exemples simples (1er étage d'une pyramide de 3 étages - 2 ème étage de cette même pyramide, etc.)
#on se rend compte qu'il faut en entrée 2 choses : l'étage souhaité et le total d'étages. En sortie, rien : on veut juste des puts.
#Si vous me demandez "mais comment t'as fait pour trouver les formules du nombre d'espace et de # ?", je vous répondrais :
#j'ai réfléchi sur papier,
#ensuite j'ai fait plein de tests sur des cas différents. Au bout d'un moment j'ai trouvé une formule qui marchait à chaque fois.
def build_floor(total_floor,current_floor)
  print " "*(current_floor-total_floor)
  print "#"*(2*total_floor-1)
  puts
end

#Le dernier problème est de faire une boucle pour construire chaque étage, un à un.
#On va boucler sur la méthode build_floor. En entrée, il nous faut simplement la hauteur totale souhaitée.
#Pas de sortie : que des puts. Le nombre d'étage à afficher est total_floor donc je m'oriente sur un total_floor.times do.
def build_pyramid(total_floor)
  puts "Voici la pyramide :"

  total_floor.times do |current_floor|
    build_floor(current_floor+1,total_floor)
  end
end

def full_pyramid
  build_pyramid(ask_floor)
end

full_pyramid