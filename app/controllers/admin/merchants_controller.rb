class Admin::MerchantsController < ApplicationController
  before_action :require_admin

  def index
    @merchants = User.merchants
  end

  def show
    @user = User.find(params[:id])
    if @user.default?
      redirect_to admin_user_path(@user)
    else
      render 'merchants/dashboard'
    end
  end

  def update
    user = User.find(params[:id])
    return not_found unless current_user.admin?

    if params[:role] && params[:role] == 'user'
      user.role = 'default'
      user.save
      flash[:notice] = "#{user.email} has been downgraded to default user status."

      return redirect_to admin_user_path(user)
    elsif params[:role] && params[:role] == 'merchant'
      user.role = 'merchant'
      user.save
      flash[:notice] = "#{user.email} has been upgraded to merchant status."

      return redirect_to admin_merchant_path(user)
    else
      user.toggle_status
      user.save

      flash[:notice] = if user.status
        "#{user.name}'s account has been enabled!"
      else
        "#{user.name}'s account has been disabled!"
      end
    end

    if user && user.merchant?
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
