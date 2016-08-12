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

	private
	def tourparams
		params.require(:tour).permit(:id, :name, :fromplace, :toplace, :fromtime, :totime, :maxmember, :creator_id, :estimatebudget, :deposit, :transport, :description, :tag_list)
	end

end
