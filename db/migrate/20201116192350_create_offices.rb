class CreateOffices < ActiveRecord::Migration[6.0]
  def change
    create_table :offices do |t|
      t.string :name
      t.string :description
      t.string :address
      t.integer :price
      t.string :availability_description
      t.string :table_num
      t.boolean :wifi
      t.boolean :amenities
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
