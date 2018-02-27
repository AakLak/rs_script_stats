class ApplicationController < ActionController::Base
  respond_to :html, :json
    acts_as_token_authentication_handler_for User, if: lambda { |controller| controller.request.format.json? }
  protect_from_forgery with: :exception
end
