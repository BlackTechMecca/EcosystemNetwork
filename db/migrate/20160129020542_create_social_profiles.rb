class CreateSocialProfiles < ActiveRecord::Migration
  def change
    create_table :social_profiles do |t|
    	t.string :twitter
    	t.string :facebook
    	t.string :instagram
    	t.string :github
    	t.string :linkedin
    	t.integer     :user_id,       null: false
    	
    	t.timestamps                  null: false
    end
    add_index :social_profiles, :user_id,                unique: true
  end
end
