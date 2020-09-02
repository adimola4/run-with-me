class AddZipcodeToTrainings < ActiveRecord::Migration[6.0]
  def change
    add_column :trainings, :zipcode, :integer
  end
end
