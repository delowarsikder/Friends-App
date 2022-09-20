class HomeController < ApplicationController
  def index
    @greeting='Welcome  Friend App'
    @time=Time.now
  end

  def aboutUs
  end
end
