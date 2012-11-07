class ChangeColumnNameToFromUserIdInMessages < ActiveRecord::Migration
  def up
    rename_column :messages, :from_user, :from_user_id
  end

  def down
    rename_column :messages, :from_user_id, :from_user
  end
end
