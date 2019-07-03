class AddSpayAndNeuterToCats < ActiveRecord::Migration[5.2]
  def change
    add_column :cats, :spay_and_neuter, :integer
  end
end
