# frozen_string_literal: true

require "swagger_helper"

describe "Posts API", type: :request, integration: true do
  path "/v1/users/{user_id}/posts" do
    post "Creates A Post" do
      tags "Posts"
      consumes "multipart/form-data"
      parameter name: :user_id, in: :path
      parameter name: :post, in: :formData, schema: {
        type: :object,
        properties: {
          "post[title]" => { type: :string},
          "post[body]" => { type: :string },
        },
        required: [
          "post[title]",

        ]
      }
      response "201", "post created" do
        let("post[title]") { "test title" }
        let("post[body]") { "test body" }
        run_test!
      end

      response "422", "invalid attributes" do
        let("post[title]") { "" }
        let("post[body]") { "test body" }
        run_test!
      end
    end
  end

  path "/v1/users/{user_id}/posts" do
    get "List all user's posts" do
      tags "Posts"
      consumes "multipart/form-data"
      parameter name: :user_id, in: :path
      parameter name: :per_page, in: :query, type: :number
      parameter name: :page, in: :query, type: :number

      response "200", "posts retrived" do
        let(:user) { create(:user)  }
        let(:user_id) { user.id }
        run_test!
      end
    end
  end
end
