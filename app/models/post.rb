class Post < ApplicationRecord
  include RailsAdminPost
  mount_uploader :image, PhotoUploader

  belongs_to :user
  validates :title, :description, presence: true
  belongs_to :creator, class_name: User.name, foreign_key: 'user_id', inverse_of: false
  has_many :comments, dependent: :destroy
end
