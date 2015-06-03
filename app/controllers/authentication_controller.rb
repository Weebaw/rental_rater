class AuthenticationController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        flash[:notice] = "Welcome Back!"
        redirect_to "/"
      else
        render :new
        flash[:notice] = "Something went wrong"
      end
  end


  def delete
    session.clear
    flash[:notice] = "You are signed out!"
    redirect_to "/"
  end

end
