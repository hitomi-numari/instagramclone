class User < ApplicationRecord
  attr_accessor:remember_token

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  has_many :pictures
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
