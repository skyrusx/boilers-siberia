class AddOtherPhoneToContacts < ActiveRecord::Migration[7.1]
  def change
    add_column :contacts, :phone_other, :string
    add_column :contacts, :working_hours_weekdays, :string
    add_column :contacts, :working_hours_weekends, :string
  end
end
