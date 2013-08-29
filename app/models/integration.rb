class Integration < ActiveRecord::Base
  attr_accessible :name, :url, :provider_type, :username, :password

  validates :url, presence: true
  validates :provider_type, presence: true
  validates :username, presence: true
  validates :password, presence: true
end
