class Photo < ApplicationRecord
  belongs_to :post

  validates :image, presence: { message: 'は必要です。' }
  
  mount_uploader :image, ImageUploader
end
