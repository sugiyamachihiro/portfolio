class AddColumnToCats < ActiveRecord::Migration[5.2]
  def change
    add_column :cats, :deleted_at, :datetime
  end
end
