class Physical < ActiveRecord::Base
	
	belongs_to :patient
	belongs_to :characteristic
end
