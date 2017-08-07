class Api::V1::ApiController < ActionController::Base
  around_action :verify_authenticity_token


  private

  def verify_authenticity_token
    # if  headers['GENA_AUTH_TOKEN'] == 'TEST'
    #   yield
    # else
    #   render json: { message: 'Please provide valid api token'}, status: :unauthorized
    # end
  end
end