class ToursController < ApplicationController
	def index
		@tours = Tour.all.order('created_at desc').limit(10)
	end

	def new
		@tour = Tour.new
	end

	def show
		@tour = Tour.find(params[:id])
	end

	def edit 
		@tour = Tour.find(params[:id])
	end

	def update
		@tour = Tour.find(params[:id])
		respond_to do |format|
			if @tour.update(tourparams)
				format.html { redirect_to @tour, notice: 'Tour was successfully updated.' }
				format.json { render :show, status: :ok, location: @tour }
			else
				format.html { render :edit }
				format.json { render json: @tour.errors, status: :unprocessable_entity }
			end
		end
	end


	
	def create
		@tour = Tour.new tourparams
		byebug
		@tour.creator = current_user

		if @tour.save
			redirect_to tours_path
		else
			render 'new'
		end
	end

	def destroy
	end

	def pick_member
		# @tour = Tour.where(id: params[:tour_id]).includes(:pending_members)
		# 	.includes(:approved_members)
		# 	.includes(:cancelled_members)

		@tour = Tour.find(params[:tour_id])
	end

	def my_tours
		curr_user = current_user
		@tours = Tour.of_user(curr_user)
	end


	def join_request		
		curr_user = current_user
		@tour = Tour.find(params[:id])

		if not @tour.has_pending_request(curr_user)
			@tour.join_request(curr_user)
		end

		respond_to do |format|
			# format.html 
			format.js { render :file => '/tours/_change_request.js.erb' }
		end
	end

	def cancel_request
		curr_user = current_user
		@tour = Tour.find(params[:id])

		if @tour.has_pending_request(curr_user)
			@tour.cancel_request(curr_user)
		end

		respond_to do |format|
			# format.html 
			format.js { render :file => '/tours/_change_request.js.erb' }
		end
	end

	def rate
		curr_user = current_user
		@tour = Tour.find(params[:id])
		if params[:point].to_i > 0 
			@tour.rated_up_by(curr_user)
		elsif params[:point].to_i < 0
			@tour.rated_down_by(curr_user)
		end

		respond_to do |format|
			# format.html 
			format.js
		end
	end

	private 
	def tourparams 
		params.require(:tour).permit(:id, :title, :name,
			:fromplace, :toplace, :fromtime, :totime, :maxmember, :creator_id,
			:estimatebudget, :deposit, :transport, :description, :tag_list,
			:bootsy_image_gallery_id) 
	end

	def create_markdown
		return Redcarpet::Markdown.new(renderer, extensions = {})
	end
end
