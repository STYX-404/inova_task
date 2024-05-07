# frozen_string_literal: true

require "swagger_helper"

# these specs will fail in rspec because let(:post) defines a post variable which makes conflict
# with a reserved post variable in rails refere to this
# (https://stackoverflow.com/questions/55066550/errordefine-methodname-memoized-fetch-or-storename-supernil)
# to understand the issue

describe "Posts API", type: :request, integration: true do
  path "/v1/users/{user_id}/posts" do
    post "Creates A Post" do
      tags "Posts"
      consumes "multipart/form-data"
      parameter name: :user_id, in: :path
      parameter name: :post, in: :formData, schema: {
        type: :object,
        properties: {
          "post[title]" => { type: :string },
          "post[body]" => { type: :string }
        },
        required: [
          "post[title]",
        ]
      }
      let(:user_id) { create(:user).id }
      response "201", "post created" do
        let(:post) { { title: "test", body: "body test" } }
        run_test!
      end

      response "422", "invalid attributes" do
        let(:post) { { title: "", body: "body test" } }
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
        let(:user_id) { create(:user).id }
        let(:page) { 1 }
        let(:per_page) { 5 }
        run_test!
      end
    end
  end
end
