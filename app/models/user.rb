class User < ApplicationRecord
  before_create :set_default_role

  include RailsAdminUser
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
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
