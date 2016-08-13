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
	
	def create
	end

	def destroy
	end

	def my_tours
		curr_user = current_user
		@mytours = curr_user.tours
	end

	def request_join

	end

	def update

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
		params.require(:tour).permit(:id, :name, :fromplace, :toplace, :fromtime, :totime, :maxmember, :creator_id, :estimatebudget, :deposit, :transport, :description, :tag_list)
	end

end
