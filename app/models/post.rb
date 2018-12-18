class Post < ApplicationRecord
  belongs_to :blog

  has_many :comments, dependent: :destroy
  has_many :likes, as: :likable, dependent: :destroy

end
