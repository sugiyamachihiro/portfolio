class RemoveColumnFromInquiryMessages < ActiveRecord::Migration[5.2]
  def change
    remove_column :inquiry_messages, :user_id, :integer
    remove_column :inquiry_messages, :admin_id, :integer
  end
end
