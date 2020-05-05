class PostsController < ApplicationController
	skip_before_action :authorized, only: [:index]

	def index
		@posts 	 = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.create(post_params)
		@post.save
		redirect_to posts_path
	end

	private
	
	def post_params
		params.require(:post).permit(:title, :body)
	end

end

