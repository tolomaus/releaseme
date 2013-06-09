class Setting < ActiveRecord::Base
  attr_accessible :email_address, :smtp_password, :smtp_port, :smtp_server, :smtp_username
end
