class Blog < ApplicationRecord
  belongs_to :user
  mount_uploader :title, ImageUploader
  validates :title, presence: true
end