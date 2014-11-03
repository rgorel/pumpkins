
module API
  module V1
    class SessionsController < API::BaseController
      include ActionController::HttpAuthentication::Digest::ControllerMethods
      REALM = 'some_secret'
      skip_before_action :authenticate

      def create
        user = nil
        authenticated = authenticate_with_http_digest(REALM) do |name|
          user = User.find_by_name(name)
          user && Digest::MD5.hexdigest([name, REALM, user.password].join(':'))
        end

        if authenticated
          respond_with({'token' => user.token}, {location: nil})
        else
          request_http_digest_authentication(REALM)
        end
      end
    end
  end
end

