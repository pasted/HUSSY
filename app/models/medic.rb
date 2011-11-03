class Medic < ActiveRecord::Base
	
	has_many :consultations
	
	has_many :employments, :dependent => :destroy
	has_many :hospitals, :through => :employments
	
	accepts_nested_attributes_for :employments, :allow_destroy => true
end
