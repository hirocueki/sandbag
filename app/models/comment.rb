class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  has_many :likes, as: :likable, dependent: :destroy

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end
