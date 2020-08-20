class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|

      t.integer :genre_id,     null: false, default: ""
      t.string :name,          null: false, default: ""
      t.text :discription,     null: false, default: ""
      t.integer :price,        null: false, default: ""
      t.string :image_id,      null: false, default: ""
      t.boolean :sales_status, null: false, default: true
      t.datetime :created_at,  null: false, default: "now"
      t.datetime :updated_at,  null: false, default: "now"
      t.timestamps
    end
  end
end
