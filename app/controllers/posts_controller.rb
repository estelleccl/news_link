class PostsController < ApplicationController
  protect_from_forgery with: :null_session, only: :create

  def index
  	if params[:tag]
	    @posts = Post.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 15).order('created_at DESC')
	  else
	    # @posts = Post.all
	    @posts = Post.all.paginate(:page => params[:page], :per_page => 15).order('created_at DESC')
	  end
  end

  def create
	  @post = Post.new(post_params)

	  if @post.save
	  	@posts = Post.all.paginate(:page => params[:page], :per_page => 15).order('created_at DESC')
	  	render :index, :notice => "Your post has been created successfully"
	  else
	  	render :index
	  end
  end

  def show
  	@post = Post.find(params[:id])
  end

  private
		def post_params
		  params.require(:post).permit(:headline, :content, :created_at, :submitted_by, :all_tags)
		end
end
