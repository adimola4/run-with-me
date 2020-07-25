class AddPublishedToTrainings < ActiveRecord::Migration[6.0]
  def change
    add_column :trainings, :published, :boolean
  end
end
