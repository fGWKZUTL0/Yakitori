class Post < ApplicationRecord
  belongs_to :user, optional: true #関連名

  has_many :likes, dependent: :destroy
  has_many :posts
  
  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end

end
