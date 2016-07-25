class PostsController < ApplicationController

    def new
      @post = Post.new
    end

    def create
      @post = User.first.posts.new(post_params)

        if(@post.save)
          redirect_to root_path
        else
          render :new
        end
      end
    private
  def  post_params
    params.require(:post).permit(:user_id, :content, :title )
  end
end
