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
  end
end
