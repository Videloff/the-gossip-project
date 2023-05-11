class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = "Vous êtes connécté en tant que : #{@user.first_name}"
      redirect_to root_path
    else
      flash[:alert] = "Email ou mot de passe invalide."
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

end