class FollowsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin, only:[:delete]
  before_action :set_user, except: [:delete]
  respond_to :js

  def create
    current_user.follow(@user)
    render json:{
      following: true
    }
end

  def get_follow_status
    render json:{
      following: (user_signed_in? && (current_user.following?(@user)))
    }
  end

  def destroy
    current_user.stop_following(@user)
    render json:{
      following: false
    }
  end

  def delete
    @currupted = Follow.find(params[:id]).destroy
    flash[:notice] = "Deleted successfully"
    redirect_to :manage_currupt
  end


  private
  def set_user
    @user = User.find(params[:id]);
  end
end
