class CreateCollaborations < ActiveRecord::Migration
  def change
    create_table :collaborations do |t|
      t.integer :owner_id
      t.string :description

      t.timestamps
    end
  end
end
