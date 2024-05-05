# frozen_string_literal: true

class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :body, :created_at, :updated_at, :user_id
  belongs_to :post
  belongs_to :user
end
