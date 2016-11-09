class SaveController < ApplicationController
  before_action :set_pin
  before_action :authenticate_user!

  def create
    @pin.upsaved_by current_user
  end

  def destroy
    @pin.unsave_by current_user
  end

  private
  def set_pin
    @pin = Pin.find(params[:id])
  end
end
