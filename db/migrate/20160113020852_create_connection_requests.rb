class CreateConnectionRequests < ActiveRecord::Migration
  def change
    create_table :connection_requests do |t|
      t.integer :requester_id
      t.integer :requestee_id
      t.datetime :accepted_at

      t.timestamps null: false
    end
  end
end
