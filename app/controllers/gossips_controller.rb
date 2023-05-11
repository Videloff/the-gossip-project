class GossipsController < ApplicationController

  def index
    @colors = ["blue", "green", "yellow", "brown", "purple", "orange"]
    @users = User.all
    @titles = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
    @user = User.find(@gossip.user_id)
    @city = City.find(@user.city_id)
  end

  def new
    @gossip = Gossip.new()
  end

  def create
    @gossip = Gossip.new(title: params['title'], content: params['content'], user_id: current_user.id)

    if @gossip.save
      flash[:success] = "Le potin a bien été créé !"
      redirect_to '/'
    else
      render 'new'
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(title: params['title'], content: params['content'])
      flash[:success] = "Le potin a bien été édité !"
      redirect_to @gossip
    else
      render :edit
    end
  end

  def destroy
    @index = Gossip.find_by(id: params[:id])
    GossipTag.all.each do |t|
      if t.gossip_id == params[:id]
        t.destroy
      end
    end
    Comment.all.each do |c|
      if c.gossip_id == params[:id]
        c.destroy
      end
    end
    @index.destroy
    flash[:success] = "Le potin a bien été supprimé !"
    redirect_to '/'
  end

end
