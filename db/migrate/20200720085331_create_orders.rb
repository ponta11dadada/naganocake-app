class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.integer :customer_id,    null: false, default: ""
      t.integer :freight,        null: false, default: ""
      t.boolean :payment_method, null: false, default: true
      t.string :postalcode,      null: false, default: ""
      t.text :address,           null: false, default: ""
      t.string :addressee,       null: false, default: ""
      t.integer :order_status,   null: false, default: 0
      t.integer :total_fee,      null: false, default: ""
      t.datetime :created_at,    null: false, default: "now"
      t.datetime :updated_at,    null: false, default: "now"
      t.timestamps
    end
  end
end
