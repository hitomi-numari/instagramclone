class User < ApplicationRecord
  attr_accessor:remember_token

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validates :name, length: { in: 3..32 }
  validates :email, length: { in: 5..256 }, uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_save { email.downcase! }
  has_many :pictures
  has_many :favorites, dependent: :destroy
  has_many :favorite_pictures, through: :favorites, source: :picture
  mount_uploader :image, UserImageUploader

  def User.digest(string)
   cost = ActiveModel::SecurePassword.min_cost ? Bcrypt::Engine::MIN_COST :
                                                BCrypt::Engine.cost
   BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
   SecureRandom::urlsafe_base64
  end

  def remember
   self.remember_token = User.new_token
   update_attribute(:remember_digest,User.digest(remember_token))
  end

end
