# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    comment { Faker::Lorem.sentence }
    rate { rand(0..5) }
    association :user
    association :post
  end
end
