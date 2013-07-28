class ChangeIntroductionColumnNameMisspelling < ActiveRecord::Migration
  def change
    rename_column :users, :introcution, :introduction
  end
end
