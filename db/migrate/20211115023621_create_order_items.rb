class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :item_id
      t.integer :order_id
      t.integer :amount
      t.integer :purchase_price
      t.integer :purchase_price
      t.integer :production_status
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
