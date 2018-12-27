class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    item = Item.find(params[:item])
    @cart.add_item(item)
    session[:cart] = @cart.contents
    count = @cart.amount(item.id)
    flash[:success] = "You now have #{"#{pluralize(count, "glass")}"} of #{item.name} in your cart."
    redirect_to items_path
  end

  def index
    @cart_items = @cart.all_items
  end

end
