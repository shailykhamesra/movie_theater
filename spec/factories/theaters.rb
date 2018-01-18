FactoryGirl.define do
  factory :theater do
    name Faker::Name.name
    address Faker::Address.city
  end
end
