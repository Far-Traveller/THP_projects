class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:create, :edit]

  def new
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.new(gossip: @gossip)
  end

  def create
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.new(user: current_user, gossip: @gossip)
    if @comment.update(post_params)
      @new_comment = true
      flash[:success] = "Merci pour ton nouveau commentaire !"
      render 'gossips/show'
    else
      render 'new'
    end
  end

  def edit
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
    if @comment.update(post_params)
      flash[:success] = "Super ! Tu as réussi à éditer ton commentaire !"
      render 'gossips/show'
    else
      render 'edit'
    end
  end

  def destroy
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
    @gossip.comments.destroy(@comment)
    @destroy = true
    flash[:danger] = "Tu as supprimé ton commentaire..."
    render "gossips/show"
  end

  def show
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
    render "gossips/show"
  end

  private

  def post_params
    post_params = params.require(:comment).permit(:content)
  end

  def authenticate_user
    unless current_user
      flash[:danger] = "T'as cru ! Vas-y connecte-toi avant de faire quoi que ce soit !!"
      redirect_to new_session_path
    end
  end

end
