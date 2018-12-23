class Posts::LikesController < ApplicationController
  before_action :set_post

  def create
    user = User.first
    @like = @post.likes.create!(user_id: user.id)
    @post.reload
  end

  def destroy
    user = User.first
    like = @post.likes.find_by!(user_id: user.id)
    like.destroy!
    @post.reload
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end
end
