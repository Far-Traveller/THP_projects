class CommentsController < ApplicationController

  def new
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.new(gossip: @gossip)
  end

  def create
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.new(user: User.find_by(first_name: 'anonymous'), gossip: @gossip)
    if @comment.update(post_params)
      @new_comment = true
      render "gossips/show"
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
      @edit_comment = true
      render "gossips/show"
    else
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
    @gossip.comments.destroy(@comment)
    @destroy = true
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

end
