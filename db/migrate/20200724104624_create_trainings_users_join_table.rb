class CreatePartnersJoinTable < ActiveRecord::Migration[6.0]
  def change

  create_join_table :trainigs, :users 
  end
end
