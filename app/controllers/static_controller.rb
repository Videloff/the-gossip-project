class StaticController < ApplicationController
  def team
  end

  def contact
  end

  def welcome
    @first_name = params[:first_name]
  end

  def index
    @colors = ["blue", "green", "yellow", "brown", "purple", "orange"]
    @users = User.all
    @titles = Gossip.all
  end

  def gossip
    @index = Gossip.find(params[:id])
    @user = User.find(@index.user_id)
  end

  def user
    @user = User.find(params[:index_user])
    @ville = City.find(@user.city_id)
  end

end
