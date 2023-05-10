class UsersController < ApplicationController

  def show
    @user = User.find(params['id'])
    @city = City.find(@user.city_id)
  end

end