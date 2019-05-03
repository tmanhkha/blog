class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: %i[slugged finders history]

  PER_PAGE = 5
  include RailsAdminPost
  mount_uploader :image, PhotoUploader

  belongs_to :user
  validates :title, :description, presence: true
  belongs_to :creator, class_name: User.name, foreign_key: 'user_id', inverse_of: false
  has_many :comments, dependent: :destroy
end
