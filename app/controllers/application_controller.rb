class ApplicationController < ActionController::API
  around_action :request_handler

  def request_handler
    yield
  rescue ActiveRecord::StatementInvalid
    head 422
  rescue ActiveRecord::RecordNotFound
    head 404
  end
end
