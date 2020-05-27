require 'gossip'
require 'sinatra'

#classe du controller qui reprends les bases de la classe de Sinatra
class ApplicationController < Sinatra::Base

# affichage de la page d'accueil, avec tous les potins et leurs objets Gossip
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

# ouvre un formulaire de création de nouveau gossip
  get '/gossips/new/' do
    erb :new_gossip
  end
  
#une fois le ragot saisie dans le formulaire, il est enregistré dans la base de données gossip.csv
  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/' #retourne sur la page d'accueil
  end

#affiche un ragot selon son id
  get '/gossips/:id/' do
    erb :show, locals: {id: params['id'].to_i, gossips: Gossip.find(params['id'].to_i)}
  end

#affiche un formulaire pour modifier/éditer un ragot
  get '/gossips/:id/edit/' do
    erb :edit, locals: {id: params['id'].to_i, gossips: Gossip.find(params['id'].to_i)}
  end

#une fois le ragot modifié saisie dans le formulaire, il est enregistré dans la base de données gossip.csv
  post '/gossips/:id/edit/' do
    Gossip.update(params['id'].to_i, params["gossip_author"], params["gossip_content"])
    redirect '/' #retourne sur la page d'accueil
  end

end