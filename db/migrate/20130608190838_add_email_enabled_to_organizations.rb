class AddEmailEnabledToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :email_enabled, :boolean
  end
end
