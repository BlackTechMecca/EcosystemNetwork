class AddCityStateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_index :users, :city
    add_index :users, :state
  end
end
