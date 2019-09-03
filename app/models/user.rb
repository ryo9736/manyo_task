class User < ApplicationRecord
  has_many :tasks,dependent: :destroy
  has_secure_password
  validates :password_digest, presence: true, length: { minimum: 6 }
  validates :name, presence: true,length: { maximum: 20 }
  validates :email, presence: true,length:{ maximum: 40 },
                      format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
end
