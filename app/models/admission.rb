class Admission < ActiveRecord::Base	
	belongs_to :consultation
	belongs_to :hospital
end
