class Cart
  def initialize(session)
    @session = session
    @cart = @session[:cart] || {}
  end

  def add_item_to_cart(product_id)
    @cart[product_id].blank? ? @cart[product_id] = 1 : @cart[product_id] += 1
    @session[:cart] = @cart
  end

  def remove_item_from_cart(product_id)
    if @cart[product_id].present?
      @cart[product_id] > 1 ? @cart[product_id] -= 1 : @cart.delete(product_id)
    end

    @session[:cart] = @cart
  end

  def remove_product_from_cart(product_id)
    @cart.delete(product_id) if @cart[product_id].present?
    @session[:cart] = @cart
  end

  def total_items
    @cart.values.reduce(:+)
  end

  def items_for_order
    @cart.map do |key, value|
      product = Product.find_by_id(key)
      if product.present?
        {
          id: product.id,
          name: product.name,
          brand: product.brand,
          model: product.model,
          sku: product.sku,
          price: product.price,
          quantity: value,
          total_item_price: product.price * value.to_i
        }
      else
        nil
      end
    end
  end
end
