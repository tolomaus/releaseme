class Setting < ActiveRecord::Base
  attr_accessible :app_name, :multi_org_enabled, :email_enabled, :domain, :email_address, :smtp_password, :smtp_port, :smtp_server, :smtp_username

  validates :app_name, presence: true
  validates :email_enabled, presence: true
end
