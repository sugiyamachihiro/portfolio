class ChangeDataVaccineToCats < ActiveRecord::Migration[5.2]
  def change
  	change_column :cats, :vaccine, :integer
  end
end
