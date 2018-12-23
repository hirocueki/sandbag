class Comments::LikesController < ApplicationController
  before_action :set_comment

  def create
    user = User.first
    @like = @comment.likes.create!(user_id: user.id)
    @comment.reload
  end

  def destroy
    user = User.first
    like = @comment.likes.find_by!(user_id: user.id)
    like.destroy!
    @comment.reload
  end

  private
  def set_comment
    @comment = Comment.find(params[:comment_id])
  end
end
