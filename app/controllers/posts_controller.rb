class PostsController < ApplicationController

	before_action :authenticate_admin!, only:[:destroy, :edit, :new, :index, :update]

	def index


		
		@posts = Post.order( "id DESC").all

	end

	

	def show

		@post = Post.find(params[:id])

	end

	

	def new
		
		@post = Post.new

	end

	

	def create

		@post = Post.new(params[:post].permit(:title, :content, :tag1))
		
		if @post.save
			redirect_to posts_path, :notice => "Post saved"

		else
			render "new", :notice => "post not saved!"

		end

	end

	

	def edit

		@post = Post.find(params[:id])

	end

	

	def update

		@post = Post.find(params[:id])

		if @post.update_attributes(params[:post].permit(:title, :content))
			redirect_to posts_path, :notice => "post updated"
		else
			render "edit"
		end

	end

	

	def destroy

		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path, :notice => "post deleted"
	end

	def recent
		
		@posts = Post.order( "id DESC").all

       
		
	end

	def sidebar 

		@posts = Post.order( "id DESC").all

	end

	
end
