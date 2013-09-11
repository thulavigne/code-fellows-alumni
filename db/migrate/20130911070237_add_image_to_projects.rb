class AddImageToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :image, :string
    remove_column :projects, :attach_file_name
    remove_column :projects, :attach_content_type
    remove_column :projects, :attach_file_size
    remove_column :projects, :attach_updated_at
  end
end
