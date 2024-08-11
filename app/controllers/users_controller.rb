require 'base64'

class UsersController < ApplicationController
  def login
    creadentials = "#{ENV['ADMIN_USERNAME']}:#{ENV['ADMIN_PASSWORD']}"
    encoded_credentials = Base64.strict_encode64(creadentials)
    access_token = "Basic #{encoded_credentials}"

    render json: { message: "Las cabeceras de autenticación son correctas.", access_token: access_token }, status: :ok
  end
end
