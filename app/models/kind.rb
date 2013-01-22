class Kind < ActiveRecord::Base
  attr_accessible :name
  has_many :machines
  translates :name
end
