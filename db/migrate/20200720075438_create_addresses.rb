class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :customer_id,            null: false, default: ""
      t.string :registration_postalcode, null: false, default: ""
      t.text :registration_address,      null: false, default: ""
      t.string :address,                 null: false, default: ""
      t.datetime :created_at,            null: false, default: "now"
      t.datetime :updated_at,            null: false, default: "now"
      t.timestamps
    end
  end
end
