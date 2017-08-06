class DashboardController < ApplicationController
  def index
  end

  def customers
    @customers = User.customers
  end
end