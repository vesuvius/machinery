class Country < ActiveRecord::Base
  attr_accessible :name
  has_many :machines
  translates :name
  default_scope :order => :name
end
