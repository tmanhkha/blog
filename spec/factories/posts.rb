FactoryBot.define do
  factory :post do
    sequence(:title) { |n| "Post title #{n}"}
    sequence(:description) { |n| "Description" }
    association :user
  end
end
