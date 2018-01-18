FactoryGirl.define do
  factory :showtime do
    timings Faker::Time.between(DateTime.now - 1, DateTime.now)
    association :movie, factory: :movie, strategy: :build
    association :screen, factory: :screen, strategy: :build
  end
end
