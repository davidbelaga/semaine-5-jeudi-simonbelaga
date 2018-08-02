class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      flash[:success] = "Vous êtes bien connecté"
      redirect_to '/'
    else
      flash.now[:danger] = "Email/mot de passe invalide"
      render 'new'
    end
  end

  def destroy
    log_out
    @current_user = nil
    redirect_to root_url
  end
end
