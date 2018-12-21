class Post < ApplicationRecord
  belongs_to :blog
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :likes, as: :likable, dependent: :destroy

end