class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  def subtotal
    self.purchase_price * self.amount
  end
end
