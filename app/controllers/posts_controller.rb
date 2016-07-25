class PostsController < ApplicationController

    def new
      @post = Post.new
    end

    def create
      @post = current_user.posts.new(post_params)

        if(@post.save)
          redirect_to '/welcome/profile'
        else
          render :new
        end
      end
      def show
        @posts = Post.all
    private
  def  post_params
    params.require(:post).permit(:user_id, :content, :title )
  end
end
