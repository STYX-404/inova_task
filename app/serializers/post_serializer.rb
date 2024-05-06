# frozen_string_literal: true

class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :average_rating, :created_at, :updated_at
  has_many :reviews
  belongs_to :user

  def average_rating
    object.average_rating
  end
end
