# frozen_string_literal: true

class V1::TopPostsController < ApplicationController

  def index
    top_posts = Post.top_posts
    paginate(collection: top_posts)
  end
end
