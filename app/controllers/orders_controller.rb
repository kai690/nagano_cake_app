class OrdersController < ApplicationController
  def new
    @order = Order.new
  end
  def create
    @order = Order.new(order_params)
  end
  private
  def order_params
    params.require(:order).permit(:payment_method, :address, :postal_code)
  end
end
