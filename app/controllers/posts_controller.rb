class PostsController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = @user.posts.build
  end

  def create
    @post = @user.posts.new(post_params)

    if @post.save
      redirect_to user_post_path(@user, @post), notice: 'Post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id]) if params[:user_id]
  end

  def post_params
    params.require(:post).permit(:title, :description, :photo)
  end
end
