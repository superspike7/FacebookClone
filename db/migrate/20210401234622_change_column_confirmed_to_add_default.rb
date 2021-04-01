class ChangeColumnConfirmedToAddDefault < ActiveRecord::Migration[6.1]
  def change
    change_column :invitations, :confirmed, :boolean, :default => false
  end
end
