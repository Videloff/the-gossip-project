class GossipsController < ApplicationController

  def index
    @colors = ["blue", "green", "yellow", "brown", "purple", "orange"]
    @users = User.all
    @titles = Gossip.all
  end

  def show
    @index = Gossip.find(params[:id])
    @user = User.find(@index.user_id)
  end

  def new

  end

  def create
    @gossip = Gossip.new(title: params['title'], content: params['content'], user_id: User.all.sample.id)

    if @gossip.save
      redirect_to '/'
    else
      render 'new'
    end
  end

end
