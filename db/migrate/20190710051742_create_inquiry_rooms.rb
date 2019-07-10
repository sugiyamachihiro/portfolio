class CreateInquiryRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiry_rooms do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
