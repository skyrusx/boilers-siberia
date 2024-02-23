class AddOrderIdToMessages < ActiveRecord::Migration[7.1]
  def change
    add_column :messages, :order_id, :integer
    remove_column :messages, :product_ids
    remove_column :messages, :service_ids
  end
end
