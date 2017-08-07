class CartsController < ApplicationController
  before_action :set_cart, only: [:add_item, :remove_item, :remove_product, :index, :make_order]

  def index
    @items = @cart.items_for_order
  end

  def add_item
    @cart.add_item_to_cart(params[:product_id])
    @items = @cart.items_for_order
    render 'index'
  end

  def remove_item
    @cart.remove_item_from_cart(params[:product_id])
    @items = @cart.items_for_order
    render 'index'
  end

  def remove_product
    @cart.remove_product_from_cart(params[:product_id])
    @items = @cart.items_for_order
    render 'index'
  end

  def make_order

  end

  private

  def set_cart
    @cart = Cart.new(session)
  end
end
