# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    comment { Faker::Lorem.sentence }
    rate { rand(0..5) }
    association :user
  end

  trait :with_post_associated do
    association :post
  end
end
