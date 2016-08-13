class TourcommentsController < ApplicationController
	def index
	end

	def new

	end

	def create
		@tour = Tour.find(params[:tour_id])
		@cmt = @tour.tourcomments.create(tourcomment_params)

		respond_to do |format|
			if @cmt.save      
				# UserMailer.notify_user(@tour).deliver_now
				format.html { redirect_to tour_path(@tour) }
				format.js 
			else
				render 'tours/show'
			end
		end
	end

	def destroy		
		@tour = Tour.find(params[:tour_id])
		@tourcomment = @tour.tourcomments.find(params[:id])
		@tourcomment.destroy
		respond_to do |format|			
			format.html { redirect_to tour_path(@tour) }
			format.js
		end
	end

	private 
	def tourcomment_params
		params.require(:tourcomment).permit(:id, :content, :commenter_id)
	end
end
