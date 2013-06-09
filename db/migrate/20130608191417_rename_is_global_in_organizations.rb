class RenameIsGlobalInOrganizations < ActiveRecord::Migration
  def up
    rename_column :organizations, :is_global, :global
  end

  def down
    rename_column :organizations, :global, :is_global
  end
end
