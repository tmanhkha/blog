class Post < ApplicationRecord

  mount_uploader :image, PhotoUploader
  validates :title, :description, presence: true

  belongs_to :user
end
