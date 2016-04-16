class UsersController < ApplicationController
    include SessionsHelper
  
  def index
  	
  end


  # GET /signup
  def new
  	@user = User.new
  end

  #POST /users
  def create
  	if !User.where(email: params[:user][:email]).present?
      @user = User.new(test_params)

  		respond_to do |format|
				if @user.save
					format.html {render "show_access_code", notice: "User was successfully created"}
					format.json {render action: 'new', status: :created}
				else
					format.html {render action: 'new'}
					format.json {render json: @user.errors, status: :unprocessable_entity}
				end
			end
		else
			@user = User.find_by_email(params[:user][:email])
			render "show_access_code"
		end
	end

  # GET /:user_id/profile
  def profile
    render 'profile'
  end

  # GET users/:user_id/edit
  def edit
    if !logged_in?
      redirect_to root_path
    else
      render 'edit'
    end
  end

  # PATCH/PUT users/:user_id
  def update
    temp = User.find_by_email(params[:user][:email])
 
    if temp && temp != current_user
      flash[:error] = "The email already existed"
      render 'edit'
    else
      respond_to do |format|
        if current_user.update(test_params)
          format.html {redirect_to profile_path(current_user), notice: "Job was successfully updated"}
          format.json {render action: 'show', location: @job}
        else
          format.html {render action: 'edit'}
          format.json {render json: @job.errors, status: :unprocessable_entity}
        end
      end
    end
  end
 
  private

  	def test_params
  		params.require(:user).permit(:email, :username)
  	end


end
