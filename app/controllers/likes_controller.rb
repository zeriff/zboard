class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pin
  respond_to :js

  def create
    @pin.upvote_by current_user
  end

  def destroy
    @pin.unvote_by current_user
  end

  private

  def set_pin
      @pin = Pin.find(params[:id])
  end
end
