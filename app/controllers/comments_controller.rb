class CommentsController < ApplicationController
  before_filter :get_post
  def index
    @comments = @post.comments
  end

  def new
    @comment = @post.comments.build
  end

  def create
    @comment = @post.comments.build(params.require(:comment).permit(:content))

      if(@comment.save)
        redirect_to '/posts'
      else
        render :new
      end
    end



    private
    def get_post
      @post = Post.find(params[:post_id])
    end
end
