class RemoveGlobalFromSettings < ActiveRecord::Migration
  def up
    remove_column :settings, :global
  end

  def down
    add_column :settings, :global, :boolean, :null => false, :default => false
  end
end
