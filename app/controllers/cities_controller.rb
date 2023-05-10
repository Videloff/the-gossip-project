class CitiesController < ApplicationController

  def show
    @colors = ["blue", "green", "yellow", "brown", "purple", "orange"]

    @city = City.find(params['id'])
    @users = User.where(city_id: @city.id)
  end

end
