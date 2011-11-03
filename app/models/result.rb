class Result < ActiveRecord::Base
	has_many :outcomes
	has_many :consultations, :through => :outcomes
end
