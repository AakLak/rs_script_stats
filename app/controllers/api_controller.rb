class ApiController < ActionController::API
  respond_to :json
  acts_as_token_authentication_handler_for User, if: lambda { |controller| controller.request.format.json? }
end
