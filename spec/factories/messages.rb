FactoryGirl.define do
  factory :message do
    body { Faker::Lorem.sentence(2) }
  end
end
