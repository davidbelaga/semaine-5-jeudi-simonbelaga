class StaticPagesController < ApplicationController
  def home
  end

  def secret
    if !logged_in?
      flash[:danger] = "Il faut être login pour pouvoir accéder à cette page"
      redirect_to login_path
    end
  end
end
