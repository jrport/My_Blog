class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  def show
    @post = Post.find(params[:id])
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(title: params[:post][:title], body: params[:post][:body])

    if @post.save
      redirect_to @post
    end
  end
  def edit 
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])

    if @post.update(title: params[:post][:title], body: params[:post][:body])
      redirect_to @post
    end
  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path, status: :see_other
  end
end
