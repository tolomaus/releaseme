class AddMultiOrgEnabledToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :multi_org_enabled, :boolean, :null => false, :default => false
  end
end
