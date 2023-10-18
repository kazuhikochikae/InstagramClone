class Blog < ApplicationRecord
  belongs_to :user
  mount_uploader :img, ImageUploader
  validates :img, presence: true
end

