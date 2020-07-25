class AddStatusToTrainings < ActiveRecord::Migration[6.0]
  def change
    if column_exists? :trainings, :status
      remove_column :trainings, :status
    end
    add_column :trainings, :status, :integer
  end
end
