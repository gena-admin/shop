module ApplicationHelper
  def cart_total_items
    Cart.new(session).total_items
  end

  def cart_has_items?
    cart_total_items.present?
  end
end
