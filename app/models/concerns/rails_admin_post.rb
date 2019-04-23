module RailsAdminPost
  extend ActiveSupport::Concern

  included do
    rails_admin do
      navigation_label 'Post'
      list do
        field :title
        field :description
        field :image
        field :creator do
          hide
        end
      end

      edit do
        field :title
        field :description
        field :image
        field :creator do
          hide
        end
      end
    end
  end
end
