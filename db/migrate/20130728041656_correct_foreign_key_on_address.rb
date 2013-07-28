class CorrectForeignKeyOnAddress < ActiveRecord::Migration
  def change
    change_table :addresses do |t|
      t.remove :user_id_id
      t.references :user
    end

    add_index :addresses, :user_id
  end
end
