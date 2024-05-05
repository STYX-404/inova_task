# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates_presence_of :body

=begin
  As it's not specified what the top posts are.
  decided to consider the top posts as the posts with reviews ordered by the posts with most reviews number first
=end
 scope :top_posts, -> { joins(:reviews).group('posts.id').order('COUNT(reviews.id) DESC') }
end
