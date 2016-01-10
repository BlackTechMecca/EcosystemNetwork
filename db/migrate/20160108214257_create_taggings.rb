class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|

      t.references :article, null: false
      t.references :tag, null: false

      t.timestamps null: false
    end
  end
end
