# frozen_string_literal: true

# The parent class of all application controllers.
class ApplicationController < ActionController::API
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :handle_unauthorized

  def current_user
    User.new
  end

  def handle_unauthorized
    render status: :unauthorized, json: { message: 'unauthorized' }
  end
end
