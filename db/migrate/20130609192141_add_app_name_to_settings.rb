class AddAppNameToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :app_name, :string
  end
end
