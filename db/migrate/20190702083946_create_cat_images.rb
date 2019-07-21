class CreateCatImages < ActiveRecord::Migration[5.2]
  def change
    create_table :cat_images, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :cat_id
      t.string :image_id

      t.timestamps
    end
  end
end
