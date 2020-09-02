class RenameLocationtolocationIn < ActiveRecord::Migration[6.0]
  def change
    rename_column :trainings, :Location, :location
  end
end
