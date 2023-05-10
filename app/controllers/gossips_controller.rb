class GossipsController < ApplicationController

  def index
    @colors = ["blue", "green", "yellow", "brown", "purple", "orange"]
    @users = User.all
    @titles = Gossip.all
  end

  def show
    @index = Gossip.find(params[:id])
    @user = User.find(@index.user_id)
    @city = City.find(@user.city_id)
  end

  def new
    @gossip = Gossip.new()
  end

  def create
    @gossip = Gossip.new(title: params['title'], content: params['content'], user_id: User.all.sample.id)

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

end
