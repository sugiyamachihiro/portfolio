class AddAdminflagToInquiryMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :inquiry_messages, :adminflag, :integer
  end
end
