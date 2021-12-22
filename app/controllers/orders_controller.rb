class OrdersController < ApplicationController
  def new
    @order = Order.new
  end
  
  def confirm
    @select_address = params[:select_address]
    @order = Order.new(order_params)
    if @select_address == 0
      @address = current_customer.address
    elsif @select_address == 1
      @address = Address.find(params[:order][:address_id])
    elsif @select_address == 2
      @address = order_params[:address]
    end
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.first_name + @address.last_name
    
  end
  
  def create
    @order = Order.new
  end
  
  
  
  private
  def order_params
    params.require(:order).permit(:payment_method, :address, :postal_code)
  end
end
