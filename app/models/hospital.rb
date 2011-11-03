class Hospital < ActiveRecord::Base
	has_many :admissions
end
