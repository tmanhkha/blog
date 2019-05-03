FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "nameuser#{n}"}
    sequence(:email) { |n| "tester#{n}@example.com" }
    password { "blogpassword" }
    password_confirmation { "blogpassword" }
  end
end
