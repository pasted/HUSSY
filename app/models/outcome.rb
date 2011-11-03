class Outcome < ActiveRecord::Base
	belongs_to :consultation
	belongs_to :result
end
