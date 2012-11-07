class AddToUserIdToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :to_user_id, :integer
  end
end
