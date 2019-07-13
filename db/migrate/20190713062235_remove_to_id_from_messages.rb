class RemoveToIdFromMessages < ActiveRecord::Migration[5.2]
  def change
    remove_column :messages, :to_id, :integer
  end
end
