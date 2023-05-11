class UsersController < ApplicationController

  def new
    @user = User.new()
  end

  def create
    @user = User.new(first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      age: params[:age],
      description: params[:description],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      city: City.all.sample
      )
    if @user.save
      @user.authenticate(params[:password])
      redirect_to '/'
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params['id'])
    @city = City.find(@user.city_id)
  end

end