class AddTrainingTypeToTrainings < ActiveRecord::Migration[6.0]
  def change
    add_column :trainings, :training_type, :string
    add_column :trainings, :details, :string
  end
end
