require 'faker/japanese'
FactoryBot.define do
  factory :item do
    name                 { Faker::Name.initials(number: 20) }
    description          { Faker::Lorem.characters(number: 100) }
    quanitity            { 1 }
    category_id          { 2 }
  end
end
