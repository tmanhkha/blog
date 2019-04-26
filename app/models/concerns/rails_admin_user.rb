module RailsAdminUser
  extend ActiveSupport::Concern

  included do
    rails_admin do
      navigation_label 'User'
      list do
        field :name
        field :email
        field :avatar
      end

      edit do
        field :name
        field :email
        field :avatar
      end
    end
  end
end
