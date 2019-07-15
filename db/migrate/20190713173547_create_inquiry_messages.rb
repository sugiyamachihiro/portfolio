class CreateInquiryMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiry_messages do |t|
      t.integer :inquiry_room_id
      t.integer :from_id
      t.text :content

      t.timestamps
    end
  end
end
