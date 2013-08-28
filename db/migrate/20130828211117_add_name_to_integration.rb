class AddNameToIntegration < ActiveRecord::Migration
  def change
    add_column :integrations, :name, :string
  end
end
