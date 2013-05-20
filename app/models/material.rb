class Material < ActiveRecord::Base
  attr_accessible :good_id, :output_rate, :property_id, :quantity, :renewable
  
  belongs_to :property
  
  validates :good_id, :uniqueness => { :scope => :property_id,
            :message => "only one material type per property"}
  
end
