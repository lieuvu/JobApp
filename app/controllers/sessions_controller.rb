class SessionsController < ApplicationController
  include SessionsHelper
  
  def new
  	flash[:error] = nil
  end

  def create
    user = User.find_by_access_code(params[:access_code])
  	if user
      flash[:error] = nil   
  		session[:id] = user.id
  		redirect_to root_path
  	else
  		flash[:error] = "Invalid access_code"
  		render 'sessions/new'
  	end
  end

  def destroy
    if logged_in?
      cookies.delete(:id)
      session.delete(:id)
    end
    redirect_to root_path
  end

end

