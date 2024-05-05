# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:username) { |n|  Faker::Name.last_name + n.to_s }
  end
end
