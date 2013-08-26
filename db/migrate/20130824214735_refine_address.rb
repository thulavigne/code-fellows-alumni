class RefineAddress < ActiveRecord::Migration
  def change
    remove_column :addresses, :zip
    add_column :addresses, :postal_code, :string
    add_column :addresses, :country, :string
  end
end
