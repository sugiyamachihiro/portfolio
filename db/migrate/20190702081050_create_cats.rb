class CreateCats < ActiveRecord::Migration[5.2]
  def change
    create_table :cats, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
    t.integer :user_id
    t.string  :title
	t.integer :prefecture
	t.text :reason
	t.integer :age
	t.string :age_detail
	t.integer :sex
	t.integer :kind
	t.string :condition
	t.string :vaccine
	t.text :remark
	t.integer :individual_or_corporate
	t.integer :cat_status, default: 0

  t.timestamps
end
  end
end
