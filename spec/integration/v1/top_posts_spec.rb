# frozen_string_literal: true

require "swagger_helper"

describe "Posts API", type: :request, integration: true do
  path "/v1/top_posts" do
    get "Lists top posts ordered by average rating" do
      tags "Posts"
      consumes "multipart/form-data"
      parameter name: :per_page, in: :query, type: :number
      parameter name: :page, in: :query, type: :number

      response "200", "top posts retrived" do
        let(:per_page) { 10  }
        let(:page) { 1  }
        run_test!
      end
    end
  end
end
