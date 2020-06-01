class GossipsController < ApplicationController
  def index
    @gossip = Gossip.new
  end
  
  def show
    @gossip = Gossip.find(params[:id].to_i)
  end

  #il faut mettre le Gossip.new, sinon le message d'erreur dans new.html.erb ne fonctionne pas 
  def new
    @gossip = Gossip.new
  end

  #il faut faire render pour que l'affichage des alertes fonctionne, parce que ça ne fait qu'afficher une view tout en gardant les variables dispos
  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user: User.find_by(first_name: 'anonymous'))
    if @gossip.save
      render 'index'
    else
      render 'new'
    end
  end

end