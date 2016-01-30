class AddLastModifiedTimestampToSocialProfile < ActiveRecord::Migration
  def change
  	add_column :social_profiles, :last_modified_timestamp, :datetime
  end
end
