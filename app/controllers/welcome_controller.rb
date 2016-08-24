class WelcomeController < ApplicationController
	def index
		if logged_in?
			@my_blogs = Blog.where(:author => current_user).order('created_at desc')
			@tours = Tour.where("creator_id = ? or creator_id in (?) ", current_user.id, current_user.following_ids) .order('created_at desc')
		else
			@upcoming_trips = Tour.upcoming.limit(3).order('fromtime asc')
			@destinations = Tour.group(:toplace).limit(10).count.to_a.sort_by(&:last).reverse
			@blogs = Blog.all.limit(2).order('view_count desc')
		end
	end
end
