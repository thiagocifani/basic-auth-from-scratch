require "ostruct"
class Api
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def data
    OpenStruct.new(code: 200, response: {name: "Supernatural", category: "Drama"})
  end
end
