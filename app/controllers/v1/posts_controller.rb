# frozen_string_literal: true

class V1::PostsController < V1::BaseController

  def index
    posts = current_user.posts.includes(:reviews)
    paginate(collection: posts)
  end

  def top
    top_posts = Post.top_posts
    paginate(collection: top_posts)
  end

  def create
    post = current_user.posts.new(post_params)
    if post.save
      render(json: post, status: :created)
    else
      render(json: post.errors, status: :unprocessable_entity)
    end
  end

    def post_params
      params.require(:post).permit(:body)
    end
end
