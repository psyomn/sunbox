class CreateCollaborationUsers < ActiveRecord::Migration
  def change
    create_table :collaboration_users do |t|
      t.integer :user_id
      t.integer :collaboration_id

      t.timestamps
    end
  end
end
