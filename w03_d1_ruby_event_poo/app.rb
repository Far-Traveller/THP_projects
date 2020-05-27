# lignes très pratiques qui appellent les gems du Gemfile. On verra plus tard comment s'en servir ;) - ça évite juste les "require" partout
require 'bundler'
Bundler.require

# lignes qui appellent les fichiers lib/user.rb et lib/event.rb
# comme ça, tu peux faire User.new dans ce fichier d'application. Top.
require_relative 'lib/event_creator'
require_relative 'lib/user'
require_relative 'lib/event'
# Maintenant c'est open bar pour tester ton application. Tous les fichiers importants sont chargés
# Tu peux faire User.new, Event.new, binding.pry, User.all, etc.

#essais :
puts vero = User.new("vero@vero.com", 32)
puts francis = User.new("francis@francis.com", 64)
puts marco = User.new("marco@marco.com", 96)
puts marco.age
puts vero.email
p User.all
puts meeting = Event.new("2020-01-13 09:00", 30, "Réunion importante !!", ["blabla@bla.com", "bidule@chose.fr", "memedans@lesorties.com"])
puts reunion = Event.new("2020-04-24 10:00", 60, "Réunion mui importante !!", ["blabla@bla.com", "memedans@lesorties.com"])
puts cours = Event.new("2020-04-20 16:00", 150, "Réunion importante !!", ["blabla@bla.com", "bidule@chose.fr", "memedans@lesorties.com"])
p meeting.postpone_24h
puts meeting.start_date
puts reunion.start_date
puts reunion.end_date
p cours.is_soon?
p meeting.to_s

puts user_1 = User.find_by_email("vero@vero.com")
puts "Voici l'age du User trouvé : #{user_1.age}"

EventCreator.new

#ajout du 21/04/20 :
  
julie = User.new("julie@email.com", 35)
jean = User.new("jean@maimail.com", 22)

my_event = Event.new("2019-01-13 09:00", 10, "standup quotidien", [julie, jean])
#on a mis des objets dans un objet, julie et jean sont des objets, plus simple que de mettre les adresses mails seules et là au moins on a pleind de données !!!

my_event.age_analysis #j'exécute la nouvelle méthode que j'ai écrite

meeting = WorkEvent.new("2019-01-17 09:00", 70, "réunion de travail", [julie, jean]) #nouvelle classe, qui reprends les attributs de la classe Event