class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :user_id
      t.integer :cat_id

      t.timestamps
    end
  end
end
