class TourcommentsController < ApplicationController
	def index
	end

	def new

	end

	def create
		@tour = Tour.find(params[:tour_id])
		@cmt = @tour.tourcomments.create(tourcomment_params)

		if @cmt.save      
			redirect_to tour_path(@tour)
		else
			render 'tours/show'
		end
	end

	def destroy
	end

	private 
	def tourcomment_params
		params.require(:tourcomment).permit(:id, :content, :commenter_id)
	end
end
