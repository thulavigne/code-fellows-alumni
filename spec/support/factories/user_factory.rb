FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@codefellow.com" }
    password "password"
    password_confirmation "password"
    first_name "Ginger"
    last_name "Griffis"
  end

  factory :admin_user do
    after_create do |user|
      user.confirm!
      user.update_attribute(:admin, true)
    end
  end
end
