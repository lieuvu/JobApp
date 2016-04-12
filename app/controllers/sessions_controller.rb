class SessionsController < ApplicationController
  
  def new
  	
  end

  def create
  	user = User.find_by(params[:session][:access_code])
  	if user
  		session[:user_id] = user.id
  		redirect_to root_path  		
  	else
  		flash.now[:danger] = "Invalid access_code"
  		render 'new'
  	end
  end

  def destroy
    if logged_in?
      cookies.delete(:user_id)
      session.delete(:user_id)
    end
    redirect_to root_path
  end

end

