class PostsController < ApplicationController
  before_action :set_post
  def index
  end

  def show
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end
end
