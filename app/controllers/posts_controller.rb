class PostsController < ApplicationController

	before_action :find_post, only: [:show, :edit, :update, :destroy]
	def index
		@posts = Post.all.limit(5).order('created_at DESC')
	end

	def new
		@post = Post.new

		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to @post, notice: "Post was saved"
		else
			render 'new', notice: "I could not save the post. Call me for help if it keeps happening"
		end
	end

	def show
		#@post = Post.find(params[:id])
	end

	def edit
		#@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if @post.update(params[:post].permit(:title, :body))
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		#@post = Post.find(params[:id])
		@post.destroy

		redirect_to root_path
	end


	private
	def post_params
		params.require(:post).permit(:title, :body, :image, :slug)
	end

	def find_post
		@post = Post.friendly.find(params[:id])
	end
end
