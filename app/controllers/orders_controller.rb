class OrdersController < ApplicationController
  before_action :signed_in_admin, only:[:statistics]
  def statistics
    Order.count_order(current_admin.id)
    binding.pry
    render nothing: true
  end
end
