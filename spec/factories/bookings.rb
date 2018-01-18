FactoryGirl.define do
  factory :booking do
    name Faker::Name.name
    phone Faker::PhoneNumber.phone_number
    creditcard Faker::PhoneNumber.phone_number
    association :showtime, factory: :showtime, strategy: :build
  end
end
