class UserAuthenticator
  attr_reader :user

  INVALID_PASSWORD = "password".freeze

  def initialize(user)
    @user = user
  end

  def authenticate(password)
    return false unless user && valid?(password)
    user.authenticate(password)
  end

  private

  def valid?(password)
    password != INVALID_PASSWORD
  end
end
