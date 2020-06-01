class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:new, :show, :edit, :udpate, :destroy]

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
    @gossip = Gossip.new(title: params[:title], content: params[:content], user: current_user)
    if @gossip.save
      flash[:success] = "Super ! Tu as réussi à créer un nouveau gossip !"
      redirect_to gossips_path
    else
      render 'new'
    end
  end

  def edit
    @gossip = Gossip.find(params[:id].to_i)
  end

  def update
    @gossip = Gossip.find(params[:id].to_i)
    if @gossip.update(gossip_params)
      @edit = true
      flash[:success] = "Super ! Tu as réussi à éditer le potin !"
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

  def gossip_params
    gossip_params = params.require(:gossip).permit(:title, :content)
  end

  def authenticate_user
    unless current_user
      flash[:danger] = "T'as cru ! Vas-y connecte-toi avant de faire quoi que ce soit !!"
      redirect_to new_session_path
    end
  end

end