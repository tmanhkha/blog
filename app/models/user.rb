class User < ApplicationRecord
  before_create :set_default_role

  include RailsAdminUser
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  DEFAULT_AVATAR = 'https://previews.123rf.com/images/pandavector/pandavector1607/pandavector160700062/60025051-businessman-icon-flat-single-avatar-people-icon-from-the-big-avatar-collection-stock-vector.jpg'
  mount_uploader :avatar, PhotoUploader

  enum role: [:user, :admin]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, presence: true, length: { minimum: 6 }

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  private

  def set_default_role
    self.role ||= :user
  end
end
