class CommentsController < ApplicationController

  def create
    @comment = Comment.create!(content: params['content'], user_id: User.all.sample.id, gossip_id: params[:gossip_id], commentable: [Gossip.all, Comment.all].sample.sample)
    flash[:success] = "Votre commentaire a été publié !"
    redirect_to gossip_path(params[:gossip_id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
