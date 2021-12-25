class Order < ApplicationRecord
  enum payment_method: { card: 0, bank: 1 }
  belongs_to :customer
  has_many :order_items

  def total_price
    billing_amount - postage
  end
end
