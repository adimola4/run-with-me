class AddIdToPartners < ActiveRecord::Migration[6.0]
  def change
    add_column :partners, :id, :primary_key
  end
end
