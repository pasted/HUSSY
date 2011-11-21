class Condition < ActiveRecord::Base
	belongs_to :conditionable, :polymorphic => :true
	belongs_to :classification
	
	module Scopes
		def historical
			where(:category => "historical")	
		end
		
		def present
			where(:category => "present")	
		end
	end
	extend Scopes
end
