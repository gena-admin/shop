class CartsController < ApplicationController
  before_action :authenticate_user!, only: [:make_order]
  before_action :set_cart, only: [:add_item, :remove_item, :remove_product, :index, :make_order]

  def index
    @items = @cart.items_for_cart
    @total_amount = @cart.total_amount
  end

  def add_item
    @cart.add_item_to_cart(params[:product_id])
    @items = @cart.items_for_cart
    render 'index'
  end

  def remove_item
    @cart.remove_item_from_cart(params[:product_id])
    @items = @cart.items_for_cart
    render 'index'
  end

  def remove_product
    @cart.remove_product_from_cart(params[:product_id])
    @items = @cart.items_for_cart
    render 'index'
  end

  def make_order
    @items = @cart.items_for_order
    order = Order.new(user: current_user, amount: @cart.total_amount, items_attributes: @items)

    if order.save
      flash[:success] = 'Order has been created successfully'
      @cart.clear
      redirect_to root_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to root_path
    end
    authorize! :make_order, Cart
  end


  private

  def set_cart
    @cart = Cart.new(session)
  end
end
