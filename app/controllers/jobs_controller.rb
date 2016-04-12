class JobsController < ApplicationController
	before_action :set_job, only:[:show]
	
	#GET /jobs
	#GEt /jobs.json
	def index
		return @jobs = Job.all
	end

	
	# GET /jobs/new
	def new
		return @job = Job.new
	end

	# GET /jobs/1
	# GET /jobs/1.json
	def show
		return @job = Job.find(params[:id])
	end

	# POST /jobs
	# POST /jobs.json
	def create
		@job = Job.new(test_params)
				
		respond_to do |format|
			if @job.save
				format.html {redirect_to @job, notice: "Job was successfully created"}
				format.json {render action: 'show', status: :created, location: @job}
			else
				format.html {render action: 'new'}
				format.json {render json: @job.errors, status: :unprocessable_entity}
			end
		end
	end


	# PATCH/PUT /job/1
	# PATCH/PUT /job/1.json
	def update
		

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

	private
		def set_job
			return @job = Job.find(params[:id])
		end

		def test_params
			return params.require(:job).permit(:company_id, :job_title, :job_des, :date_valid)
		end
end
