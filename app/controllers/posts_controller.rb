class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

    def index
      @posts = Post.order('created_at DESC')

    end

    def myposts
      @user = current_user
      if current_user
      @posts = current_user.posts.order('created_at DESC')
    else
      redirect_to new_user_session_path
    end

    end

    def new
      @post = Post.new
    end

    def edit
    end

    def show
      @post = Post.find(params[:id])
      @comment = Comment.new
    end

    def create
      @post = current_user.posts.new(post_params)

        if(@post.save)
          redirect_to '/posts/myposts'
        else
          render :new
        end
      end

    def update
      if @posts.update_attributes(post_params)
          redirect_to root_path
      else
        render :edit
      end
    end

    def destroy
      @post.destroy
      redirect_to '/posts'
    end

    private

    def set_post
     @post = Post.find(params[:id])
   end

   def  post_params
     params.require(:post).permit(:user_id, :content, :title ,:genre)
   end
 end
