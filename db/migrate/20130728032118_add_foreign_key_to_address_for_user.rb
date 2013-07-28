class AddForeignKeyToAddressForUser < ActiveRecord::Migration
  def change
    change_table :addresses do |t|
      t.references :user_id
    end
  end
end
