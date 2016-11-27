class AppController < ApplicationController
  before_action :authenticate_user!

  def index
    # @pins = Pin.paginate(:page => params[:page]).as_json(include: { user: { only: [:username, :avatar]}})
  end
  def getpins
    @pins = Pin.paginate(:page => params[:page]).as_json(include: { user: { only: [:username, :avatar]}})
    render json: @pins;
  end
end
