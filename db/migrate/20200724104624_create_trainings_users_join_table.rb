class CreateTrainingsUsersJoinTable < ActiveRecord::Migration[6.0]
  def change
      create_join_table :trainings, :users 
  end
end
