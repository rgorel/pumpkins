
class API::BaseController < ActionController::API
  include ActionController::MimeResponds
  include ActionController::ImplicitRender
  include ActionController::HttpAuthentication::Token::ControllerMethods 
  respond_to :json, :xml

  SECRET = '4e79bb0b8ddc665ad69c26570b5c50a37a6fe4e2912d5800d68c0720a3023b41'

  before_action :authenticate

  protected
  def authenticate
    @current_user = authenticate_with_http_token do |token| 
      User.find(JWT.decode(token, SECRET).first['user_id'])
    end

    head 401 unless @current_user
  rescue JWT::DecodeError
    head 401
  end
end


