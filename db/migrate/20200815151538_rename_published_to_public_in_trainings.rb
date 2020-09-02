class RenamePublishedToPublicInTrainings < ActiveRecord::Migration[6.0]
  def up
    rename_column :trainings, :published, :public
  end

  def down
    rename_column :trainings, :public, :published
  end
end
