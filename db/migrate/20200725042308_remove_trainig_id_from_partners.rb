class RemoveTrainigIdFromPartners < ActiveRecord::Migration[6.0]
  def change
    remove_column :partners, :trainig_id, :bigint
  end
end
