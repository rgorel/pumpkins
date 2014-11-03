class User < ActiveRecord::Base
  def self.authenticate_by_token(token)
    first.token == token
  end

  def password
    'password'
  end

  def token
    '48990736263c9f573ff634a1cb66cbcd'
  end
end
