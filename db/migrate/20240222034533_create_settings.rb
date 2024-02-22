class CreateSettings < ActiveRecord::Migration[7.1]
  def change
    create_table :settings do |t|
      t.string :main_title
      t.string :main_subtitle
      t.string :main_email
      t.string :main_phone
      t.string :main_address
      t.string :main_button_text
      t.string :main_button_link

      t.string :block2_title
      t.boolean :block2_show, default: true

      t.string :block3_title
      t.boolean :block3_show, default: true
      t.string :block3_button_text
      t.string :block3_button_link

      t.string :block4_title
      t.boolean :block4_show, default: true
      t.string :block4_button_text
      t.string :block4_button_link

      t.string :block5_title
      t.boolean :block5_show, default: true

      t.string :block6_title
      t.boolean :block6_show, default: true
      t.string :block6_button_text
      t.string :block6_button_link

      t.string :block7_title
      t.boolean :block7_show, default: true
      t.string :block7_button_text
      t.string :block7_button_link

      t.boolean :contacts_show, default: true
      t.string :contacts_title
      t.text :contacts_map
      t.boolean :contacts_show_map, default: true

      t.timestamps
    end
  end
end
