class CreateTrainings < ActiveRecord::Migration[6.0]
  def change
    create_table :trainings do |t|
      t.string :title
      t.datetime :date
      t.string :duration
      t.integer :participants
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
