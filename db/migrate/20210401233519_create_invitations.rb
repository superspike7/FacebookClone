class CreateInvitations < ActiveRecord::Migration[6.1]
  def change
    create_table :invitations do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :confirmed

      t.timestamps
    end
  end
end
