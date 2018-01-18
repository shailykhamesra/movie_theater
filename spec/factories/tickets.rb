FactoryGirl.define do
  factory :ticket do
    price Faker::Number.positive
    association :showtime, factory: :showtime, strategy: :build
    association :booking, factory: :booking, strategy: :build
  end
end
