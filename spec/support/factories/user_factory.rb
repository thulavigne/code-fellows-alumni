FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@codefellow.com" }
    password "password"
    password_confirmation "password"
    first_name "Ginger"
    last_name "Griffis"
  end
end
