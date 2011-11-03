class Contact < ActiveRecord::Base
	has_many :relationships
	has_many :consultations, :through => :relationships
	
end
