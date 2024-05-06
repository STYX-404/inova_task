# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates_presence_of :title

  scope :top_posts, -> {
    joins(:reviews)
      .select("posts.*, AVG(reviews.rate) AS average_rating")
      .group("posts.id")
      .order("average_rating DESC")
  }

  def average_rating
    reviews.average(:rate).to_f
  end
end
