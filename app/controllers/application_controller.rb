class ApplicationController < ActionController::API
  before_action :authenticate
  
  private
  def authenticate
    #method provided by Rails that performs basic HTTP authentication
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['ADMIN_USERNAME'] && password == ENV['ADMIN_PASSWORD']
    end
  end
end
