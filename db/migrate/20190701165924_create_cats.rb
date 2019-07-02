class CreateCats < ActiveRecord::Migration[5.2]
  def change
    create_table :cats do |t|
      t.integer :user_id
      t.string :title
      t.string :prefecture
      t.text :reason
      t.integer :age
      t.string :age_detail
      t.integer :sex
      t.integer :kind
      t.text :condition
      t.string :vaccine
      t.text :remark
      t.integer :individual_or_corporate
      t.integer :cat_status

      t.timestamps
    end
  end
end
