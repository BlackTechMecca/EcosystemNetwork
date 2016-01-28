class AddStateCdToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :state_cd, :string
  	add_index  :users, :state_cd, unique: true
  end
end
