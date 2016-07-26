class PostsController < ApplicationController

    def index
      @posts = Post.order('created_at DESC')
    end

    def myposts
      @posts = current_user.posts.order('created_at DESC')
    
    end

    def new
      @post = Post.new
    end

    def create
      @post = current_user.posts.new(post_params)

        if(@post.save)
          redirect_to '/posts/myposts'
        else
          render :new
        end
      end

      def show
        @posts = Post.all
      end

    private
  def  post_params
    params.require(:post).permit(:user_id, :content, :title )
  end
end
