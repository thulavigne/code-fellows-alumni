class AddColumnToProjectsTable < ActiveRecord::Migration
  def change
    add_column :projects, :date_deployed, :date
  end
end
