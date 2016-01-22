class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|

      t.string  :taggable_type 
      t.integer :taggable_id
      t.references :tag

      t.timestamps null: false
    end
    add_index :taggings, [:taggable_id, :taggable_type]
  end
end
