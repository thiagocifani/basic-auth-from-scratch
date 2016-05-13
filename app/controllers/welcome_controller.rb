class WelcomeController < ApplicationController
  before_filter :authorize

  def index
    @tv_show = TvShow.new(Api.new(current_user).data)
  end
end
