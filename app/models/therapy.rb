class Therapy < ActiveRecord::Base
	has_many :treatments
	has_many :consultations, :through => :treatments
end
