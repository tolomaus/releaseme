class CreateIntegrations < ActiveRecord::Migration
  def change
    create_table :integrations do |t|
      t.string :url
      t.string :username
      t.string :password
      t.string :provider_type

      t.timestamps
    end
  end
end
