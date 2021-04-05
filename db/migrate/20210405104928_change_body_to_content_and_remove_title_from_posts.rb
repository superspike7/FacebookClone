class ChangeBodyToContentAndRemoveTitleFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :title 
    rename_column :posts, :body, :content
  end
end
