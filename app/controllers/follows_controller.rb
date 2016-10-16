class FollowsController < ApplicationController
  before_action :set_user
  respond_to :js

  def create
    current_user.follow(@user)
  end

  def destroy
    current_user.stop_following(@user)
  end

  private
  def set_user
    @user = User.find(params[:id]);
  end
end
