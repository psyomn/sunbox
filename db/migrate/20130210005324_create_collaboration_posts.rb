class CreateCollaborationPosts < ActiveRecord::Migration
  def change
    create_table :collaboration_posts do |t|
      t.string :message
      t.integer :author_id
      t.integer :collaboration_id

      t.timestamps
    end
  end
end
