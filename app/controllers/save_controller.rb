class SaveController < ApplicationController
  before_action :auth_user, except: [:get_save_status]
  before_action :set_pin

  def get_save_status
    render json:{
      saved: (user_signed_in? && (current_user.saved_for? @pin))
    }
  end

  def create
    @pin.upsaved_by current_user
    render json:{
      saved: true
    }
  end

  def destroy
    @pin.unsave_by current_user
    render json:{
      saved: false
    }
  end

  private
    def set_pin
      @pin = Pin.find(params[:id])
    end
end
