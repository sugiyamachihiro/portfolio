class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :room_id
      t.integer :from_id
      t.integer :to_id
      t.text :content

      t.timestamps
    end
  end
end
