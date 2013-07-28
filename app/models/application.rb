class Application < ActiveRecord::Base
  attr_accessible :name

  has_many :components, :dependent => :destroy

  validates :name, presence: true
end
