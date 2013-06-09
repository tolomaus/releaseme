class RemoveMoreSettingColsFromOrganization < ActiveRecord::Migration
  def up
    remove_column :organizations, :domain
    remove_column :organizations, :email_address
    remove_column :organizations, :email_enabled
    remove_column :organizations, :smtp_password
    remove_column :organizations, :smtp_username
    remove_column :organizations, :smtp_port
    remove_column :organizations, :smtp_server
  end

  def down
    add_column :organizations, :domain, :string
    add_column :organizations, :email_address, :string
    add_column :organizations, :email_enabled, :boolean
    add_column :organizations, :smtp_password, :string
    add_column :organizations, :smtp_username, :string
    add_column :organizations, :smtp_port, :integer
    add_column :organizations, :smtp_server, :string
  end
end
