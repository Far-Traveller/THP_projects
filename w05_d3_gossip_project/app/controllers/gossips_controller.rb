class GossipsController < ApplicationController
#il faut mettre le Gossip.new, sinon le message de notif dans index.html.erb ne fonctionne pas 
  def index
    @gossip = Gossip.new
  end
  
  def show
    @gossip = Gossip.find(params[:id].to_i)
    @edit = false
    @destroy = false
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

  def edit
    @gossip = Gossip.find(params[:id].to_i)
  end

  def update
    @gossip = Gossip.find(params[:id].to_i)
    if @gossip.update(post_params)
      @edit = true
      render 'show'
    else
      render 'edit'
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id].to_i)
    @gossip.destroy
    @destroy = true
    render 'index'
  end

  private

  def post_params
    post_params = params.require(:gossip).permit(:title, :content)
  end

end