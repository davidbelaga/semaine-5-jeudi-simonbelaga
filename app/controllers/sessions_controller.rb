class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      flash[:success] = "Vous êtes bien connecté"
      redirect_to '/'
    else
      flash.now[:danger] = "Email / mot de passe invalide"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    @current_user = nil
    redirect_to root_url
  end
end
