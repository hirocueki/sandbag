class BlogsController < ApplicationController
  before_action :set_blog, only: :show

  def index
    @blogs = Blog.all.order(:name)
  end

  def show
  end

  private
  def set_blog
    @blog = Blog.find(params[:id])
  end
end
