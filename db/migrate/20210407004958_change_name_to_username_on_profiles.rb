class ChangeNameToUsernameOnProfiles < ActiveRecord::Migration[6.1]
  def change
    rename_column :profiles, :name, :username 
  end
end
