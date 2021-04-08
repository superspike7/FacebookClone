class AddProfileColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :bio, :text, limit: 200
    add_column :users, :hobbies, :text, limit: 200
    add_column :users, :birth_date, :date
    add_column :users, :gender,  :string
  end
end
