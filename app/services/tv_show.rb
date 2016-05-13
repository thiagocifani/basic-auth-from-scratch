class TvShow
  attr_reader :tv_show

  def initialize(tv_show)
    @tv_show = tv_show
  end

  def name
    tv_show.response[:name]
  end

  def category
    tv_show.response[:category]
  end
end
