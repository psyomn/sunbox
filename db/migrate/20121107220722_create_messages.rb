class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :to_user
      t.string :contents
      t.integer :from_user
      t.integer :to_user

      t.timestamps
    end
  end
end
