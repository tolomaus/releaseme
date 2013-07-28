class Component < ActiveRecord::Base
  attr_accessible :name

  belongs_to :application

  validates :name, presence: true
end
