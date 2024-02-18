class CreateBonuses < ActiveRecord::Migration[7.1]
  def change
    create_table :bonuses do |t|
      t.string :text
      t.boolean :show_text, :default => true

      t.timestamps
    end
  end
end
