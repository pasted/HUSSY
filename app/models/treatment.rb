class Treatment < ActiveRecord::Base
	has_one :consultation
	has_one :therapy
end
