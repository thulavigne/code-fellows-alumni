class ChangeAddressToText < ActiveRecord::Migration
  def change
    change_table :addresses do |t|
      t.remove :street_address
      t.text :street_address
    end
  end
end
