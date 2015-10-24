class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :requester_id
      t.integer :accepted_id

      t.timestamps null: false
    end
    add_index :groups, :requester_id
    add_index :groups, :accepted_id
    add_index :groups, [:requester_id, :accepted_id], unique: true
  end
end
