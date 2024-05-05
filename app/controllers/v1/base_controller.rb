class V1::BaseController < ApplicationController
  before_action :current_user

  private
    def current_user
      User.find(params[:user_id])
    end

    def paginate(collection:, options: {})
      byebug
      per_page = params[:per_page]
      page = params[:page] || 1
      collection = collection.page(page).per(per_page)
      render({
        json: collection, adapter: :json, meta: {
          next_page: collection.next_page,
          previous_page: collection.prev_page,
          current_page: collection.current_page,
          per_page: per_page,
        }
      }.merge(options))
    end
end
