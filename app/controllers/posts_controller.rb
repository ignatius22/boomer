class PostsController < ApplicationController
  before_action :set_user
  before_action :set_post, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @posts = Post.all
    @users = User.all
    @post = current_user.posts.build
  end




  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @other_posts = @user.posts.where.not(id: @post.id)
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to user_post_path(current_user, @post), notice: 'Post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to user_post_path(@user, @post), notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end




  private

  def set_user
    @user = User.find(params[:user_id]) if params[:user_id]
  end

  def post_params
    params.require(:post).permit(:title, :description, :photo)
  end

  def set_post
    @post = @user.posts.find(params[:id])
  end
end
