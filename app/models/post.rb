class Post < ApplicationRecord
  mount_uploader :image, PhotoUploader

  belongs_to :user
  validates :title, :description, presence: true
end
