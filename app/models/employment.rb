class Employment < ActiveRecord::Base
	
	belongs_to :medic
	belongs_to :hospital
end
