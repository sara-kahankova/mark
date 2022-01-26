class PostsController < ApplicationController
  before_action :find_post, only: %i(edit show update destroy)

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit; end

  def update
    @post.update(post_params)
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def show; end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
