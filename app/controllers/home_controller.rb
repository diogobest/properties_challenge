class HomeController < ApplicationController
  def index
    @properties = Property.all.limit(10)
  end
end
