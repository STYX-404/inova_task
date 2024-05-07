# frozen_string_literal: true

require "swagger_helper"

describe "Reviews API", type: :request, integration: true do
  path "/v1/users/{user_id}/reviews" do
    post "Adds review to a post" do
      tags "Reviews"
      consumes "multipart/form-data"
      parameter name: :user_id, in: :path
      parameter name: :review, in: :formData, schema: {
        type: :object,
        properties: {
          "review[comment]" => { type: :string },
          "review[rate]" => { type: :number, description: "Number between 1 and 5" },
          "review[post_id]" => { type: :number },
        },
        required: [
          "review[comment]",
          "review[post_id]"
        ]
      }
      let(:user_id) { create(:user).id }
      let(:post_id) { create(:post).id }
      response "201", "review created" do
        let(:review) { { comment: "test", rate: 5, post_id: post_id } }
        run_test!
      end

      response "422", "invalid attributes" do
        let(:review) { { comment: "", rate: 9, post_id: post_id } }
        run_test!
      end
    end
  end
end
