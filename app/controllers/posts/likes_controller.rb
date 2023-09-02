class Posts::LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def update
    if @post.like_by?(current_user)
      @post.unlike(current_user)
    else
      @post.like(current_user)
    end
  end
private
    def set_post
        @post = Post.find(params[:post_id])
    end
end
