class BlogsController < ApplicationController
	before_action :logged_in_user, only: [:new, :create, :edit, :update]
	before_action :correct_user, only: [:edit, :update, :destroy]
	def index
		if params[:tag]
			@blogs = Blog.tagged_with(params[:tag])
		else	
			@blogs = Blog.published.lastest_blog
		end
	end

	def new
		@blog = Blog.new
	end

	def create
		@blog = Blog.new(blog_params)
		@blog.author_id = params[:author]
		if @blog.save
			flash[:info] = "Create new blog success"
			redirect_to blog_path(@blog)
		else
			render 'new'
		end
	end

	def show
		@blog = Blog.find(params[:id])
	end

	def edit
		@blog = Blog.find(params[:id])
	end

	def update
		@blog = Blog.find(params[:id])
		if @blog.update_attributes(blog_params)
			flash[:success] = "Blog updated"
			redirect_to blog_path(@blog)
		else
			render 'edit'
		end
	end
	
	def publish
		@blog = Blog.find(params[:id])
		@blog.update_attributes(:published => true, :published_at => Time.zone.now)
		redirect_to blog_path(@blog)
	end
	
	def unpublish
		@blog = Blog.find(params[:id])
		@blog.update_attributes(:published => false, :published_at => nil)
		redirect_to blog_path(@blog)
	end

	private
		def blog_params
			params.require(:blog).permit(:title, :extended_html_content, :author, :photo_url, :bootsy_image_gallery_id, :tag_list)
		end

		def correct_user
			@blog = Blog.find(params[:id])
			if !current_user.admin? && @blog.author_id != current_user.id
				redirect_to root_path
			end
		end
end
