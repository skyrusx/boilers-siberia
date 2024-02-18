class CreateSupports < ActiveRecord::Migration[7.1]
  def change
    create_table :supports do |t|
      t.string :title
      t.string :link
      t.integer :group_id

      t.timestamps
    end
  end
end
