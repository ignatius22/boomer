class CommentsController < ApplicationController

    def create
        @post = Post.find(params[:post_id])
        @post = @post.comments.create(comment_params)
        @comment.user = current_user
        redirect_to post_path(@post)
      end
    
    private
    def comment_params
        params.require(:comment).permit(:commenter, :body)
    end

    def set_post
        @post = Post.find(params[:post_id])
      end
    
      def set_comment
        @comment = @post.comments.find(params[:id])
      end
    
      def comment_params
        params.require(:comment).permit(:content)
      end
end
