FactoryGirl.define do
  factory :user do
    name     "Name Surname"
    email    "user@example.com"
    password "password"
    password_confirmation "password"
  end
end

