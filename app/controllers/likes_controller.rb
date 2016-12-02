class LikesController < ApplicationController
  before_action :auth_user, except: [:get_like_status]
  before_action :set_pin
  respond_to :js


  def get_like_status
    render json: {
      liked: (user_signed_in? && (current_user.liked? @pin)),
      likesCount: @pin.get_upvotes.size
    }
  end

  def create
    @pin.upvote_by current_user
    render json: {
      liked: true,
      likesCount: @pin.get_upvotes.size
    }
  end

  def destroy
    @pin.unvote_by current_user
    render json: {
      liked: false,
      likesCount: @pin.get_upvotes.size
    }
  end

  private
    def set_pin
        @pin = Pin.find(params[:id])
    end
end
