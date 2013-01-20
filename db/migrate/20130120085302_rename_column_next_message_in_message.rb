class RenameColumnNextMessageInMessage < ActiveRecord::Migration
  def up
    rename_column :messages, :next_message_id, :previous_message_id
  end

  def down
    rename_column :messages, :previous_message_id, :next_message_id
  end
end
