class Admin::UsersController < ApplicationController
  before_action :require_admin

  def index
    @users = User.default_users
  end

  def show
    @user = User.find(params[:id])
    render "users/show"
  end

  def update
    user = User.find(params[:id])
    user.toggle_status
    user.save
    flash[:notice] = if user.status
       "#{user.name}'s account has been enabled!"
    else
      "#{user.name}'s account has been disabled!"
    end
    if params[:redirect] && params[:redirect].eql?("merch_index")
      redirect_to admin_merchants_path
    else
      redirect_to admin_users_path
    end
  end

  private
  
  def require_admin
    render file: 'public/404', status: 404 unless current_user && current_user.admin?
  end
end
