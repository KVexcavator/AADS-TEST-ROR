class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @posts = Post.where(user: current_user.followed_users).order(created_at: :desc)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
