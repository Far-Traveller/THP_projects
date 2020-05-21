def signup
  puts "Bonjour, merci d'enregistrer ton mot de passe"
  print ">"
  password = gets.chomp
  return password
end

def login(password)
  puts "Tu veux accéder aux secrets ? Rentre ton mot de passe"
  print ">"
  password_login = gets.chomp
  while password_login != password
   puts "Mais ? Que racontes-tu ! C'est impossible... !! Recommences"
   print">"
   password_login = gets.chomp
  end
end

def welcome_screen
  puts "Bienvenue dans ta zone secrète !!"
  puts "En vérité tu n'as aucun secret à découvrir, tu sais déjà tout"
  puts "Bonne journée gros !"
end

def perform
  password = signup
  login(password)
  welcome_screen
end

perform