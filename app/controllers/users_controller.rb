class UsersController < ApplicationController

  def new

  end

  def create

  end

  def show
    @user = User.find(params['id'])
    @city = City.find(@user.city_id)
  end

end