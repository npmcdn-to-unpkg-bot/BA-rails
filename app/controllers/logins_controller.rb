class LoginsController < ApplicationContoller

  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.autenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "You are logged in"
      redirect_to posts_path
    else
      flash.now[:danger] = "Your email address or Password doesn't match."
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have Logged Out."
    redirect_to root_path
  end
end
