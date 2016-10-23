class FollowsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin, only:[:delete]
  before_action :set_user, except: [:delete]
  respond_to :js

  def create
    current_user.follow(@user)
  end

  def destroy
    current_user.stop_following(@user)
    @likecount = 0
    @user.pins.each do |p|
      @likecount = @likecount +  p.get_likes.size
    end
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
