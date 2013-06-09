class AddColsToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :domain, :string
    add_column :settings, :email_address, :string
  end
end
