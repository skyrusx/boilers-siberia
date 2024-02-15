class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.string :type
      t.string :name
      t.string :phone
      t.text :question
      t.text :product_ids, array: true, default: []
      t.text :service_ids, array: true, default: []

      t.timestamps
    end
  end
end
