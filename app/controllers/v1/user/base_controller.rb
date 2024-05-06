class V1::User::BaseController < ApplicationController
  before_action :set_current_user
  before_action :validate_current_user

  private

    def validate_current_user
      render(
        json: { error: "User with id #{params[:user_id]} is not found"},
        status: :not_found
      ) unless @current_user.present?
    end

    def set_current_user
      @current_user = User.find_by_id(params[:user_id])
    end
end
