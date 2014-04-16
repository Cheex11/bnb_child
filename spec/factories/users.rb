
FactoryGirl.define do
  factory :user, :class => User do
    username { Faker::Internet.user_name }
    email { Faker::Internet.email }
    password "password"
    password_confirmation { |u| u.password }
  end
end
