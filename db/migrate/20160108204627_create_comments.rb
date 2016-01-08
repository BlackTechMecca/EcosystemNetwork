class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, null: false
      t.string :body, null: false

      t.timestamps null: false
    end
  end
end
