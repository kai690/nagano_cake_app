class OrdersController < ApplicationController
  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    # @total = @order.order_items.inject(0) { |sum, purchase_price| sum + order_item.subtotal }
  end

  def new
    @order = Order.new
  end

  def confirm
    @postage = 800
    @total_price = 0
    @cart_items = current_customer.cart_items
    @select_address = params[:order][:select_address].to_i
    @order = Order.new(order_params)
    # @billing_amount = @total_price + @postage
    @order.billing_amount = @billing_amount
    @order.customer_id = current_customer.id

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
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

    current_customer.cart_items.each do |cart_item|
      order_item = OrderItem.new
      order_item.item_id = cart_item.item_id
      order_item.order_id = @order.id
      order_item.amount = cart_item.amount
      order_item.purchase_price = cart_item.item.with_tax_price
      order_item.save
    end
    current_customer.cart_items.destroy_all

    redirect_to thanks_orders_path

  end



  private
  def order_params
    params.require(:order).permit(:payment_method, :address, :postal_code, :name, :billing_amount, :postage)
  end
end
