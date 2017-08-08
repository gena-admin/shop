class DashboardController < ApplicationController
  def index
  end

  def customers
    @customers = User.customers
    authorize! :customers_list, User
  end

  def orders
    @customers = User.select('*').from('number_of_orders_for_users')
    authorize! :orders, User
  end
end