class ChangeTypeToMessages < ActiveRecord::Migration[7.1]
  def change
    rename_column :messages, :type, :type_feedback
  end
end
