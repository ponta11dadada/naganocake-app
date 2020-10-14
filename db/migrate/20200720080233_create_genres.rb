class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|

      t.string :name,         null: false, default: ""
      t.boolean :is_valid,    null: false, default: true
      t.datetime :created_at, null: false, default: "now"
      t.datetime :updated_at, null: false, default: "now"
      t.timestamps
    end
  end
end
