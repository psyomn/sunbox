class ChangeToUserIdFormatInMessage < ActiveRecord::Migration
  def up
    change_column :messages, :to_user_id, :integer
  end

  def down
    change_column :messages, :to_user_id, :string
  end
end
