
class API::BaseController < ActionController::API
  include ActionController::MimeResponds
  include ActionController::ImplicitRender
  include ActionController::HttpAuthentication::Token::ControllerMethods 
  respond_to :json, :xml

  before_action :authenticate

  protected
  def authenticate
    @current_user = authenticate_with_http_token do |token| 
      User.authenticate_by_token(token) 
    end

    head 401 unless @current_user
  end
end


