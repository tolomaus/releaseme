class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :smtp_username
      t.string :smtp_password
      t.string :smtp_server
      t.integer :smtp_port
      t.boolean :global, :default => false, :null => false
      t.boolean :email_enabled, :default => false, :null => false
      t.boolean :multi_org_enabled, :default => false, :null => false

      t.timestamps
    end
  end
end
