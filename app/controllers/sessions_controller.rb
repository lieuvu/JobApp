class SessionsController < ApplicationController
  
  # ---------------
  # Include helpers
  # ---------------

  include SessionsHelper
  
  # ------
  # Layout
  # ------

  layout 'main_non_login'

  def new
    flash[:error] = nil
  end

  def create
    user = User.find_by_access_code(params[:access_code])
  	if user then
      flash[:error] = nil   
  		session[:id] = user.id
  		redirect_to root_path
  	else
  		flash[:error] = "Invalid Access Code"
  		render 'sessions/new'
  	end
  end

  def destroy
    if current_user then
      cookies.delete(:id)
      session.delete(:id)
    end
    redirect_to root_path
  end

end

