class Account < ApplicationRecord
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }

  #email 	「必須」「最大255文字」「正しいフォーマット」「一意」を検証。保存する前に大文字を小文字に変換。
  #password 	「必須」「最小6文字」を検証。セキュアなパスワードを設定。

  has_secure_password
end
