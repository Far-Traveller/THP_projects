require "pry"

class User
  attr_accessor :email, :age
  @@user_array = []

  def initialize(email_to_save, age_to_save)
    @email = email_to_save
    @age = age_to_save
    @@user_array << self #mets le dernier utilisateur dans l'array, le self fait référence à l'instance
  end

  def self.all #permet de récupérer un array contenant tous les utilisateurs déjà créés. Il faudra mettre p User.all dans le terminal ou dans le app.rb
    return @@user_array
  end

  def self.find_by_email(email)
    @@user_array.each do |user|
      if user.email == email
        return user
      else
        puts "sorry, cet email n'existe pas, recommence !"
      end
    end
  end

end #fin de la classe

binding.pry
puts "THE END, good bye !"