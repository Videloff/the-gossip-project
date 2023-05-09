class UsersController < ApplicationController

  def show
    @user = User.find(params['id'])
    @ville = City.find(@user.city_id)
  end

end