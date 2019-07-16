class AddDetailsToInquiryMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :inquiry_messages, :user_id, :integer
    add_column :inquiry_messages, :admin_id, :integer
  end
end
