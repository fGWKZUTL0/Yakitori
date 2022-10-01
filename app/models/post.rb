class Post < ApplicationRecord
  belongs_to :user, optional: true #関連名
end
