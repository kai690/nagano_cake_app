class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @postage = 800
    @total_price = 0
    @cart_items = current_customer.cart_items
    @select_address = params[:order][:select_address].to_i
    @order = Order.new(order_params)
    @billing_amount = @total_price + @postage

    if @select_address == 0
      @order.address = current_customer.address
      @order.postal_code = current_customer.postal_code
      @order.name = current_customer.last_name + current_customer.first_name
    elsif @select_address == 1
      @address = Address.find(params[:order][:address_id])
      @order.address = @address.address
      @order.postal_code = @address.postal_code
      @order.name = @address.name
    end

  end

  def create

  end



  private
  def order_params
    params.require(:order).permit(:payment_method, :address, :postal_code, :name)
  end
end
