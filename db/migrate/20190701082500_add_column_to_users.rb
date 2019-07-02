class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nick_name, :string
    add_column :users, :user_name, :string
    add_column :users, :sex, :integer
    add_column :users, :birthday, :date
    add_column :users, :postalcode, :string
    add_column :users, :prefecture, :integer
    add_column :users, :address, :string
    add_column :users, :telephone_number, :string
    add_column :users, :profile_image_id, :string
    add_column :users, :profession, :integer
    add_column :users, :introduction, :text
    add_column :users, :user_status, :integer
  end
end
