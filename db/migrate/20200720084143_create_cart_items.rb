class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|

      t.integer :product_id,       null: false, default: ""
      t.integer :customer_id,      null: false, default: ""
      t.integer :quantity_in_cart, null: false, default: ""
      t.datetime :created_at,      null: false, default: "now"
      t.datetime :updated_at,      null: false, default: "now"
      t.timestamps
    end
  end
end
