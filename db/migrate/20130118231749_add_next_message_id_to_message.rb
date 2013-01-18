class AddNextMessageIdToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :next_message_id, :integer
  end
end
