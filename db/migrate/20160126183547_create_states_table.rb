class CreateStatesTable < ActiveRecord::Migration
  def change
    create_table :states do |t|
    	t.string :state_cd
    	t.string :name
    end

    add_index :states, :state_cd, unique: true
  end
end
