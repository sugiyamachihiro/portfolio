class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :cat_id
      t.integer :user_id

      t.timestamps
    end
  end
end
