class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def create
  end

  private
		def post_params
		  params.require(:post).permit(:headline, :content, :submitted_by, :all_tags)
		end
end
