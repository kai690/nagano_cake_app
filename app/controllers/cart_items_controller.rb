class CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
  end

  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.customer_id = current_customer.id
    if cart_item.save
      redirect_to root_path, notice:'カートに商品が追加されました'
    else
      redirect_to item_path(@item)
    end
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
  end

end
