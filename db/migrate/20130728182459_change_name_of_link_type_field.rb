class ChangeNameOfLinkTypeField < ActiveRecord::Migration
  def change
    rename_column :links, :type, :url_type
  end
end
