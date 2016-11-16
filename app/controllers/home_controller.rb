class HomeController < ApplicationController
  respond_to :js

  # ROOT PATH
  def index
    # @pins = Pin.paginate(:page => params[:page]).order("created_at desc")
    if user_signed_in?
      @pins = Pin.tagged_with(current_user.intrest_list, :on => :genre, :any => true).paginate(:page => params[:page]).order("created_at desc")
    else
      # @pins = Pin.paginate(:page => params[:page]).order("created_at desc")
      @pins = Pin.paginate(:page => params[:page]).order("created_at desc")
      # Model.distinct.pluck(:rating)
    end
    # @pins = Pin.includes(:user).where(user_id: current_user.follows.select(:followable_id)).paginate(:page => params[:page]).order("created_at desc")
    # --- Buisiness logic for premium accounts
    # if user_signed_in? && current_user.is_an_admin?
    #   redirect_to :superuser_dashboard
    # else
    #   if user_signed_in?
    #     if current_user.follows.count > 0
    #       @pins = Pin.includes(:user).where(user_id: current_user.follows.select(:followable_id)).paginate(:page => params[:page]).order("created_at desc")
    #     else
    #       @pins = Pin.paginate(:page => params[:page]).order("created_at desc")
    #     end
    #   else
    #     @pins = Pin.paginate(:page => params[:page]).order("created_at desc")
    #   end
    # end

  end

  def findfriend
    @users = User.all_except(current_user).paginate(:page => params[:page])
  end

  def followers
    @users = User.find_by(username: params[:username]).followers
  end

  def follows
    @follows = User.find_by(username: params[:username]).follows
    @users = []
    @follows.each do |f|
      @users.push(f.followable)
    end
  end

  def profile
    @user = User.find_by(username: params[:username])
    @boards = Board.where(user_id: @user.id)
  end

  def edit_profile

  end

  def savedpins
    @user = User.find_by(username: params[:username])
    @pins = @user.saves.up.order("created_at desc").saveables
  end

  def board
    @board = Board.find(params[:board_id])
    @user = User.find_by(username: params[:username])
    @pins = @board.pins.order("created_at desc")
  end

  def pins
    @user = User.find_by(username: params[:username])
    @pins = @user.pins.order("created_at desc")
  end
end
