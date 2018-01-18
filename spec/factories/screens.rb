FactoryGirl.define do
  factory :screen do
    number Faker::Number.number(2)
    association :theater, factory: :theater, strategy: :build
    association :movie, factory: :movie, strategy: :build
  end
end
