require 'rubygems'
require 'nokogiri' #demande la gem Nokogiri
require 'open-uri' #nécessaire pour ouvrir un site
require 'pry'

def initialisation_nokogiri(url)
  page = Nokogiri::HTML(open(url)) #appelle le site à ouvrir, ici on mets url et il faudra l'appeler dans une autre méthode
  return page
end

def get_townhall_email(townhall_url)
#récupère l'email d'une mairie à partir de l'URL de mairies (qu'on déterminera dans la méthode d'après)
  page = Nokogiri::HTML(open(townhall_url))
  array_email = Array.new

  townhall_email = page.xpath('//*[contains(text(), "@")]').text #si j'ai bien compris LA DOC : ça ne marche que s'il n'y a qu'un @ dans la page..
  townhall_town = page.xpath('//*[contains(text(), "RENSEIGNEMENTS SUR LA MAIRIE DE")]').text.split #il faut spliter la phrase pour ne récupérer que le nom de la ville

  array_email << {townhall_town[5] => townhall_email} #5 = c'est l'emplacement dans la phrase de la ville
  return array_email
end

def get_townhall_urls
#récupère les URLs de chaque ville du Val d'Oise
  page = initialisation_nokogiri("http://annuaire-des-mairies.com/val-d-oise.html")

  array_urls = Array.new

  townhall_urls = '//a[@class="lientxt"]'
  townhall_urls_length = page.xpath(townhall_urls).length


  (0..townhall_urls_length-1).each { |url|
    url = page.xpath(townhall_urls).text
    array_urls << url
  }
  return array_urls
end

def dontknow
  #imbriquer les 2 méthodes du dessus
  array_urls = get_townhall_urls
  array_urls.each do |townhall_url|
    get_townhall_email(townhall_url)
    puts "Le hash #{townhall_url} est bien créé"
  end
end

dontknow