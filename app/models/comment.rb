class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  delegate :avatar, to: :user, prefix: :user
end
