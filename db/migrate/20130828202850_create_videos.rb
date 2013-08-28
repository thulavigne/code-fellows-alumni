class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.string :video_link
      t.references :user

      t.timestamps
    end
    add_index :videos, :user_id
  end
end
