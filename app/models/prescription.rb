class Prescription < ActiveRecord::Base
	
	belongs_to :drug
	belongs_to :consultation
end
