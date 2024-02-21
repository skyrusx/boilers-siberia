class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :title
      t.decimal :old_price, default: 0.0
      t.decimal :price, default: 0.0
      t.text :description
      t.string :sku
      t.string :type

      t.timestamps
    end
  end
end
