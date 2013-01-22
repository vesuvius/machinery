class Machine < ActiveRecord::Base
  attr_accessible :country_id, :stock_number, :id_number, :initial_id, :kind_id, :make, :name, :price, :workshop_id, :year_of_production
  belongs_to :country
  belongs_to :kind
  has_many :pictures, :dependent => :destroy
  translates :id_number, :stock_number, :name, :initial_id, :make
  
  def kind_name
    kind.name rescue nil
  end
  
  def country_name
    country.name rescue nil
  end
  
end
