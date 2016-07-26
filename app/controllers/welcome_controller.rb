class WelcomeController < ApplicationController
  def index
  end

  def home
    @posts = Post.all
    @post = Post.new
  end

  def profile
  end

  def oops
      @post = current_user.posts
  end
end
