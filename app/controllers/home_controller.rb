class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @pins = Pin.all.order("created_at desc")
  end
end
