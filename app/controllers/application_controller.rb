class ApplicationController < ActionController::API

  def paginate(collection:, options: {})
    per_page = params[:per_page] || 10
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
