class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|

      t.string :title, null:false
      t.text :body, null:false
      t.string :img_url

      t.timestamps null: false
    end
  end
end
