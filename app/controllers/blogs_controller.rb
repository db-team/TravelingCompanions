class BlogsController < ApplicationController
	before_action :set_user, only: [:new, :create]

	def index
		if params[:tag]
			@blogs = Blog.tagged_with(params[:tag])
		else	
			@blogs = Blog.all
		end
	end

	def new
		@blog = Blog.new
	end

	def create
		@blog = Blog.new(blog_params)
		@blog.author_id = params[:author].to_s
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
			render @blog
		else
			render 'edit'
		end
	end

	private
		def blog_params
			params.require(:blog).permit(:title, :extended_html_content, :author, :bootsy_image_gallery_id, :tag_list)
		end

		def set_user
			unless current_user
				redirect_to root_url
			end
		end
end
