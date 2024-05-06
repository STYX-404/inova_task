# frozen_string_literal: true

class V1::User::ReviewsController < V1::User::BaseController

  def create
    review = @current_user.reviews.new(review_params)
    if review.save
      render(json: review, status: :created)
    else
      render(json: review.errors, status: :unprocessable_entity)
    end
  end

    def review_params
      params.require(:review).permit(:comment, :rate, :post_id)
    end
end
