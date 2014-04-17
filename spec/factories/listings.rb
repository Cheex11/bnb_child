# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :listing, :class => Listing do
    title "Fantastic house in the hills"
    price 124
    location "the large hill ten hills away from Portland OR"
    bedrooms 2
    bathrooms 7
    description "This is a house of merimont and warmth. You will feel welcomed by our pleasent loving vibes and never want to leave this fantastic abode"
    user_id 34
  end
end
