class Order < ApplicationRecord
  enum payment_method: { card: 0, bank: 1 }
end
