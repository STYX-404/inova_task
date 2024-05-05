# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    body { Faker::Lorem.sentence }
    association :user
  end
end
