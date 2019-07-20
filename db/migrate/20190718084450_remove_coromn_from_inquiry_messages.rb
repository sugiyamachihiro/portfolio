class RemoveCoromnFromInquiryMessages < ActiveRecord::Migration[5.2]
  def change
    remove_column :inquiry_messages, :from_id, :integer
  end
end
