class Picture < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  mount_uploader :image, PictureImageUploader
  attr_accessor :action_required
  validates :image_or_content, presence: true
  private
    def image_or_content
      image.presence or content.presence
    end

end
