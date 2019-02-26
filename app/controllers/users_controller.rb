class UsersController < ApplicationController
  
  # ---------------
  # Include helpers
  # ---------------
  
  include SessionsHelper
  
  # --------------
  # Filter methods
  # --------------

  before_action :check_logged_in?, only: [:profile, :edit, :update]
  
  # ------
  # Layout
  # ------

  layout 'main_non_login'

  # GET /signup
  def new
  	@user = User.new
  end

  #POST /users
  def create
    if !User.where(email: params[:user][:email]).present?
      @user = User.new(test_params)
      flash[:error] = nil

  		respond_to do |format|
				if @user.save
					format.html {render "show_access_code", notice: "User was successfully created"}
					format.json { render action: 'new', status: :created }
				else
					format.html { render action: 'new' }
          format.json do
            render json: @user.errors, status: :unprocessable_entity
          end
				end
			end
		else
      flash[:error] = "User already existed"
			@user = User.find_by_email(params[:user][:email])
			render "show_access_code"
		end
	end

  # GET /:user_id/profile
  def profile
    render layout: 'main_login'
  end

  # GET users/:user_id/edit
  def edit
    render layout: 'main_login'
  end

  # PATCH/PUT users/:user_id
  def update
    another_user = User.find_by_email(params[:user][:email])
 
    if another_user.present? && another_user != current_user
      flash[:error] = "The email already existed"
      render 'edit'
    else
      respond_to do |format|
        if current_user.update_attributes(test_params)
          format.html { redirect_to profile_path(current_user) }
          format.json { render action: 'show', location: @job }
        else
          format.html { render action: 'edit' }
          format.json do 
            render json: @job.errors, status: :unprocessable_entity
          end
        end
      end
    end
  end
 
  private def test_params
  	params.require(:user).permit(:email, :username)
  end

  private def check_logged_in?
    redirect_to root_path if current_user.blank?
  end

end
