# frozen_string_literal: true

class V1::User::PostsController < V1::User::BaseController

  def index
    posts = @current_user.posts.includes(:reviews)
    paginate(collection: posts)
  end

  def create
    post = @current_user.posts.new(post_params)
    if post.save
      render(json: post, status: :created)
    else
      render(json: post.errors, status: :unprocessable_entity)
    end
  end

  private
    def post_params
      params.require(:post).permit(:body, :title)
    end
end
