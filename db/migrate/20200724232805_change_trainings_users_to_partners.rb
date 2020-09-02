class ChangeTrainingsUsersToPartners < ActiveRecord::Migration[6.0]
  def change
    rename_table :trainings_users, :partners

  end
end
