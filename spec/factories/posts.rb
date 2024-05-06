# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    body { Faker::Lorem.paragraph}
    title { Faker::Lorem.sentence}
    association :user

    trait :with_reviews do
      after(:build) do |post|
        post.reviews << create_list(:review, rand(0..5), post: post)
      end
    end
  end
end
