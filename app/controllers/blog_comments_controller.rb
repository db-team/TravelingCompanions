class BlogCommentsController < ApplicationController
  def create
    @blog = Blog.find(params[:id])
    @comment = @blog.blog_comments.new(comment_params)
    @comment.save
    redirect_to @blog
  end
  
  def destroy
  end
  
  private
    def comment_params
      params.require(:blog_comment).permit(:commenter_id, :body)
    end
end
