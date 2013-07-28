class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :description
      t.string :url_text
      t.string :type
      t.integer :owner_id
      t.string :owner_type

      t.timestamps
    end
  end
end
