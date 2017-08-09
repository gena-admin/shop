class Api::V1::ApiController < ActionController::Base
  around_action :verify_authenticity_token

  private

  def verify_authenticity_token
    # In a general way we should use AUTH token which related to each
    # user(we should store it in DB) etc. But now I am using one token for site.
    if request.headers['SHOP_AUTH_TOKEN'] == 'MY_AUTH'
      yield
    else
      render json: { message: 'Please provide valid api token'}, status: :unauthorized
    end
  end
end