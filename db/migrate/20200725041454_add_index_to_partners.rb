class AddIndexToPartners < ActiveRecord::Migration[6.0]
  def change
    add_column :partners, :training_id, :bigint
    add_index :partners, :training_id
  end
end
