# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post_without_title) { build(:post, title: nil) }
  let(:valid_post) { create(:post) }
  let(:top_post) { create(:post) }
  let(:low_rating_post) { create(:post) }
  let(:review_1) { create(:review, rate: 5, post_id: top_post.id) }
  let(:review_2) { create(:review, rate: 4, post_id: top_post.id) }
  let(:review_3) { create(:review, rate: 3, post_id: low_rating_post.id) }

  describe 'validations' do
    context "when title is blank" do
      it 'fails' do
        expect(post_without_title.valid?).to be false
      end
    end

    context "when post is valid" do
      it 'fails' do
        expect(valid_post.valid?).to be true
      end
    end
  end

  describe 'scopes' do
    describe '.top_posts' do
      before do
        top_post
        low_rating_post
        review_1
        review_2
        review_3
        Post.top_posts.reload
      end
      it 'returns posts ordered by average rating' do
        expect(Post.top_posts.first.id).to eq(top_post.id)
        expect(Post.top_posts.second.id).to eq(low_rating_post.id)
      end
    end
  end

  describe '#average_rating' do
    it 'returns the average rating of reviews for the post' do
      post = create(:post)
      create(:review, post: post, rate: 4)
      create(:review, post: post, rate: 5)

      expect(post.average_rating).to eq(4.5)
    end

    it 'returns 0.0 if the post has no reviews' do
      post = create(:post)
      expect(post.average_rating).to eq(0.0)
    end
  end
end
