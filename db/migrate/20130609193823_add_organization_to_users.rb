class AddOrganizationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :organization_id, :integer, :index => true
    change_column :users, :organization_id, :integer, :null => false
  end
end
