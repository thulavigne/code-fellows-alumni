class AddCodefellowFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone_number, :string
    add_column :users, :street_address, :text
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip, :string
    add_column :users, :introcution, :text
    add_column :users, :desired_job_situation, :text
    add_column :users, :desired_job_location, :text
    add_column :users, :skills, :text
  end
end
