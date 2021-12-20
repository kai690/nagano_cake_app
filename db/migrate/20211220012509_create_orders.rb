class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :order_status
      t.string :postal_code
      t.string :name
      t.string :address
      t.integer :billing_amount
      t.integer :postage
      t.integer :payment_method
      t.timestamps
    end
  end
end
