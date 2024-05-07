# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:review_without_comment) { build(:review, comment: nil) }
  let(:review_with_invalid_rate) { build(:review, rate: 7) }
  let(:valid_review) { build(:review) }

  describe 'validations' do
    context "when comment is blank" do
      it 'fails' do
        expect(review_without_comment.valid?).to be false
      end
    end
    context "when rate is not a number" do
      it 'fails' do
        expect(review_with_invalid_rate.valid?).to be false
      end
    end

    context "when review is valid" do
      it 'success' do
        expect(valid_review.valid?).to be true
      end
    end
  end
end
