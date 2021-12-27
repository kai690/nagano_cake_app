class CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @total_price = 0
  end

  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.customer_id = current_customer.id
    if cart_item.save
      redirect_to cart_items_path, notice:'カートに商品が追加されました'
    else
      redirect_to item_path(@item)
    end
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path, notice:'カート商品を全て削除しました'
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path, notice:'商品が１件削除されました'
  end



  private
  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
  end

end
