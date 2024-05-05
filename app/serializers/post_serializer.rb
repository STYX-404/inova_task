# frozen_string_literal: true

class PostSerializer < ActiveModel::Serializer
  attributes :id, :body, :created_at, :updated_at
  has_many :reviews
  belongs_to :user
end
