class CommentsController < ApplicationController

  def create
    if session[:user_id]
      @comment = Comment.create!(content: params['content'], user_id: current_user.id, gossip_id: params[:gossip_id], commentable: [Gossip.all, Comment.all].sample.sample)
      flash[:success] = "Votre commentaire a été publié !"
      redirect_to gossip_path(params[:gossip_id])
    else
      flash[:alert] = "Vous devez être connecté pour commenter"
      render "/sessions/new"
    end
  end

  def edit
    @comment = Comment.find_by(id: params[:id])
  end

  def update
    @comment = Comment.find_by(id: params[:id])
    @path = Gossip.find_by(id: @comment.gossip_id)
    if @comment.update(content: params['content'])
      flash[:success] = "Le commentaire a bien été édité !"
      redirect_to @path
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @path = Gossip.find_by(id: @comment.gossip_id)
    @comment.destroy
    flash[:success] = "Le commentaire a bien été supprimé !"
    redirect_to @path
  end

end
