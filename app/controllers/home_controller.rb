class HomeController < ApplicationController
  respond_to :js
  def index
    @pins = Pin.paginate(:page => params[:page]).order("created_at desc")
  end

  def findfriend
    @users = User.all_except(current_user).paginate(:page => params[:page])
  end

  def profile
    @user = User.find_by(username: params[:username])
    @boards = Board.where(user_id: @user.id)
  end

  def board
    @board = Board.find(params[:board_id])
    @pins = @board.pins.order("created_at desc")
  end

  def pins
    @pins = current_user.pins.order("created_at desc")
  end
end
