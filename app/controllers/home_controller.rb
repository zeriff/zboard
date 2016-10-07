class HomeController < ApplicationController
  def index
    @pins = Pin.all.order("created_at desc")
  end
end
