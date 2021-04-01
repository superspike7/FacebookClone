class AddFriendIdToInvitation < ActiveRecord::Migration[6.1]
  def change
    add_column :invitations, :friend_id, :integer
  end
end
