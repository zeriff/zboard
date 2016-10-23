class SuperuserController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  def dashboard
    @users = User.all
    @pins = Pin.all
  end

  def manage_pins
    @pins = Pin.paginate(:page => params[:page]).order("created_at desc")
  end

  def manage_users
    @users = User.paginate(:page => params[:page]).order("created_at desc")
  end

  def manage_categories
    @categories = Category.all
  end

  def manage_currupt
    @curruptedRows =   Follow.where.not(followable_type: "User")
  end

  def delete_user
    @user = User.find(params[:id])
    @user.destroy
    redirect_to :root
  end

  def create_admin
    @user = User.find(params[:id])
    @user.is_an_admin = true
    @user.save
    redirect_to :root
  end

  private
  def authenticate_admin
    if !current_user.is_an_admin?
      redirect_to :root
      flash[:error] = "You are not authorized"
    end
  end
end
