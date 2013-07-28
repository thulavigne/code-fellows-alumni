class RemoveAddressFieldsFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :street_address
    remove_column :users, :city
    remove_column :users, :state
    remove_column :users, :zip
  end
end
