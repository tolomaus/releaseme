class RemoveSettingColsFromOrganization < ActiveRecord::Migration
  def up
    remove_column :organizations, :multi_org_enabled
    remove_column :organizations, :global
  end

  def down
    add_column :organizations, :multi_org_enabled, :boolean
    add_column :organizations, :global, :boolean
  end
end
