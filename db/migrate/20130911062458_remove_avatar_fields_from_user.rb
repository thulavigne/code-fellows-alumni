class RemoveAvatarFieldsFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :avatar_file_name
    remove_column :users, :avatar_content_type
    remove_column :users, :avatar_file_size
    remove_column :users, :avatar_updated_at
    remove_column :users, :attach_file_name
    remove_column :users, :attach_content_type
    remove_column :users, :attach_file_size
    remove_column :users, :attach_updated_at
  end
end
