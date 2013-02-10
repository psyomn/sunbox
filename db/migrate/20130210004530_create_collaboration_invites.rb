class CreateCollaborationInvites < ActiveRecord::Migration
  def change
    create_table :collaboration_invites do |t|
      t.integer :owner_id
      t.integer :invitee_id
      t.integer :collaboration_id
      t.string :message

      t.timestamps
    end
  end
end
