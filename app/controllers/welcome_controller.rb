class WelcomeController < ApplicationController
	def index
		if logged_in?
			redirect_to user_path current_user
		else
			@upcoming_trips = Tour.upcoming.limit(3).order('fromtime asc')
			@destinations = Tour.group(:toplace).limit(10).count.to_a.sort_by(&:last).reverse
			@user = User.new
			@blogs = Blog.all.limit(2)
		end
	end
end
