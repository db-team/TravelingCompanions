class TourcommentsController < ApplicationController
	def index
	end

	def new

	end

	def create
		@tour = Tour.find(params[:tour_id])
		@cmt = @tour.tourcomments.create(tourcomment_params)

		if @cmt.save      
			UserMailer.notify_user(@tour).deliver_now
			redirect_to tour_path(@tour)
		else
			render 'tours/show'
		end
	end

	def destroy		
		@tour = Tour.find(params[:tour_id])
		@tourcomment = @tour.tourcomments.find(params[:id])
		@tourcomment.destroy
		redirect_to tour_path(@tour)
	end

	private 
	def tourcomment_params
		params.require(:tourcomment).permit(:id, :content, :commenter_id)
	end
end
