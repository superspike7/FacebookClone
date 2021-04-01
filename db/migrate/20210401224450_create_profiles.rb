class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.integer :age
      t.string :hobby, array: true  
      t.string :status
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
