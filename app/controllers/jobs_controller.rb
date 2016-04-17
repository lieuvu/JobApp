class JobsController < ApplicationController
	include SessionsHelper
	before_action :set_job, only:[:show]
	before_action :check_logged_in?, only: [:new, :create, :edit, :update, :destroy]
	
	
	#GET /jobs
	#GEt /jobs.json
	def index
		if logged_in? && params[:user_id]			
			@jobs = Job.where(company_id: current_user.id)
			render 'jobs/jobs_posted'
		elsif params[:sort_by].nil?
			@jobs = Job.all
		elsif
			@jobs = Job.all.sort(params[:sort_by])
		end
	end

	
	# GET /users/:user_id/jobs/new
	def new
		if !current_user.nil? && current_user.role.downcase == "company"
			@job = Job.new
		else
			redirect_to root_path
		end
	end

	# GET /jobs/1
	# GET /jobs/1.json
	def show
		@job = Job.find(params[:id])
	end

	# POST /users/:user_id/jobs
	# POST /users/:user_id/jobs.json
	def create
		@job = Job.new(test_params)
				
		respond_to do |format|
			if @job.save
				format.html {redirect_to user_job_path(@job.company_id, @job.id), notice: "Job was successfully created"}
				format.json {render action: 'show', status: :created, location: @job}
			else
				format.html {render action: 'new'}
				format.json {render json: @job.errors, status: :unprocessable_entity}
			end
		end
	end

	# GET /users/:user_id/jobs/1/edit
	def edit
		@job = Job.find(params[:id])
		@job[:date_valid] = @job.date_valid.strftime("%d.%m.%Y")
		return @job
	end

	# PATCH/PUT /users/:user_id/jobs/1
	# PATCH/PUT /users/:user_id/jobs/1.json
	def update
		@job = Job.find(params[:id])

		respond_to do |format|
			if @job.update(test_params)
				format.html {redirect_to @job, notice: "Job was successfully updated"}
				format.json {render action: 'show', location: @job}
			else
				format.html {render action: 'edit'}
				format.json {render json: @job.errors, status: :unprocessable_entity}
			end
		end
	end

	# DELETE /users/:user_id/jobs/1/destroy
	def destroy
		@job = Job.find(params[:id])
		@job.destroy
		redirect_to user_jobs_path
	end

	private

		def set_job
			if !Job.exists?(params[:id])
				redirect_to root_path
			else
				@job = Job.find(params[:id])
			end
		end

		def test_params
			params[:job][:company_id] = params[:user_id]
			params.require(:job).permit(:company_id, :job_title, :job_des, :date_valid)
		end

		def check_logged_in?
      if !logged_in?
       	redirect_to root_path
      end
   	end
end
