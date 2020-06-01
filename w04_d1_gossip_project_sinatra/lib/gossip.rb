require 'csv'

class Gossip
  attr_accessor :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end

  def save
#append mode (ab) : permet d'ajouter
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author,@content]
    end
  end

  def self.all
    all_gossips = []
# lis le csv ligne par ligne et les implémente dans l'array all_gossips
    CSV.read("./db/gossip.csv").each do |csv_line| 
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  def self.find(id)
    gossips_id = []
    CSV.read("./db/gossip.csv").each_with_index do |row, index|
      #va vérifier si l'index de chaque gossip est égal à l'id demandé, si oui il le mets dans l'array
      if (id == index+1)
        gossips_id << Gossip.new(row[0], row[1])
        break
        end
    end
    return gossips_id
  end

  def self.update(id, author, content)
    edit_gossip = []
#il faut recréer un array et un csv avec les nouvelles données
    CSV.read("./db/gossip.csv").each_with_index do |row, index|
      if id.to_i == (index + 1)
        edit_gossip << [author, content]
      else
#je ne comprends pas cette ligne là, mais sans ça ne fonctionne pas et personne n'a réussi à me l'expliquer..
        edit_gossip << [row[0], row[1]]
      end
    end
# le w c'est pour write
    CSV.open("./db/gossip.csv", "w") do |csv| 
      edit_gossip.each do |row|
        csv << row
    end
  end
  end

end