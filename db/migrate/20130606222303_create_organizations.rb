class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name, :null => false
      t.string :email_address
      t.string :smtp_username
      t.string :smtp_password
      t.string :smtp_server
      t.integer :smtp_port
      t.boolean :is_global, :default => false

      t.timestamps
    end
  end
end
