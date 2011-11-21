class Treatment < ActiveRecord::Base
	belongs_to :consultation
	belongs_to :therapy
end
