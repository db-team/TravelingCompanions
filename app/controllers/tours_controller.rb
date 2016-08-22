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
		@tour.creator = current_user

		if @tour.save
			redirect_to tours_path
		else
			render 'new'
		end
	end

	def destroy
	end

	def my_tours
		curr_user = current_user
		@tours = Tour.of_user(curr_user)
	end



	def browse_members		
		@tour = Tour.find(params[:tour_id])

	end

	def pick_member
		user_id = params[:user_id]
		@tour = Tour.find(params[:tour_id])		
		@member = @tour.sorted_members.find(user_id)
		
		respond_to do |format|
			unless @tour.enough_members?
			    @tour.pick_member(user_id)
				format.html { redirect_to tour_browse_members_path(@tour.id) }
				format.js { render 'browse_members.js.erb'}
			else
				format.html { redirect_to tour_browse_members_path(@tour.id), error: "Chuyen di da du thanh vien, vui long chinh sua so luong thanh vien toi da truoc khi ket nap them." }
				format.js { flash[:error] = "Chuyen di da du thanh vien, vui long chinh sua so luong thanh vien toi da truoc khi ket nap them." ;
				 render 'browse_members.js.erb'}
			end
		end
	end

	def reject_member
		user_id = params[:user_id]
		@tour = Tour.find(params[:tour_id])
		@member = @tour.sorted_members.find(user_id)

		respond_to do |format|
			if @tour.reject_member(user_id)
				format.html { redirect_to tour_browse_members_path(@tour.id) }
				format.js { render 'browse_members.js.erb'}
			end
		end
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
			format.html { redirect_to :back}
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
			:bootsy_image_gallery_id, :user) 
	end

	def create_markdown
		return Redcarpet::Markdown.new(renderer, extensions = {})
	end
end
