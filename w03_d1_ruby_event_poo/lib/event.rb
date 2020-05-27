require 'time'
require 'pry'

class Event
  attr_accessor :start_date, :duration, :title, :attendees

  def initialize(start_date, duration, title, attendees)
    @start_date = Time.parse(start_date) #converti un string en time
    @duration = duration
    @title = title
    @attendees = attendees #il faudra rentrer un array ["avec les différentes adresse mail"]
  end

  def postpone_24h
    @start_date = @start_date + 24*60*60 #24*60*60 = 24h de décallage
  end

  def end_date 
    @end_date = @start_date + @duration*60
  end

  def is_past?
    return @start_date < Time.now
  end

  def is_future?
    return !is_past? #donne le contraire de is_past? parce que ! donne le contraire d'un booléen
  end

  def is_soon?
    return @start_date - Time.now < 30*60
  end

  def to_s
    puts ">Titre : #{@title}"
    puts ">Date de début : #{@start_date}"
    puts ">Durée : #{@duration} minutes"
    puts ">Invités :"
    puts @attendees.join(', ')
  end

  #ajout du 21/04/20
  def age_analysis
    age_array = [] #On initialise un array qui va contenir les âges de tous les participants à un évènement
    average = 0 #On initialise une variable pour calculer la moyenne d'âge à l'évènement

    @attendees.each do |attendee| #On parcourt tous les participants (objets de type User)
      age_array << attendee.age #leur âge est stocké dans l'array des âges
      average = average + attendee.age #leur âge est additionné pour préparer le calcul de la moyenne
    end

    average = average / @attendees.length #on divise la somme des âges pour avoir la moyenne

    puts "Voici les âges des participants :"
    puts age_array.join(", ")
    puts "La moyenne d'âge est de #{average} ans"
  end

end #fin de la classe

class WorkEvent < Event #nouvelle classe, qui reprends les attributs de la classe Event (exceptionnellement on l'a mise dans le même rb)
  attr_accessor :location #on veut ajouter une localisation alors que dans la classe event il n'y en a pas.

  def initialize(start_date, duration, title, attendees, location)
    @location = location # j'ai rajouté cette ligne par rapport à la classe Event

    super(start_date, duration, title, attendees) #fait appel au initialize de la classe Event, super permet de rappeler les lignes de codes sans avoir à les copier coller
  end

  def is_event_acceptable?
    if @attendees.length > 3 || @duration > 60
      puts "Cette réunion ne respecte pas nos bonnes pratiques !"
      return false
    else
      puts "Cette réunion est OK."
      return true
    end
  end
end

binding.pry

puts "THE END, or... IS IT ? *tatataaaaaaa*"