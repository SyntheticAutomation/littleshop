class Admin::UsersController < ApplicationController

  def index
    @users = User.default_users
  end

  def show
    @merchants = User.merchants
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
end
