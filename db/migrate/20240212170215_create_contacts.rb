class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :contacts do |t|
      t.string :region
      t.string :representative
      t.string :address
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
