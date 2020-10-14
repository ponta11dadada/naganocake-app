class CreateOrderingProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :ordering_products do |t|

	  t.integer :product_id,         null: false, default: ""
      t.integer :order_id,           null: false, default: ""
      t.integer :purchased_price,    null: false, default: ""
      t.integer :purchased_quantity, null: false, default: ""
      t.integer :production_status,  null: false, default: 0
      t.datetime :created_at,        null: false, default: "now"
      t.datetime :updated_at,        null: false, default: "now"
      t.timestamps
    end
  end
end
