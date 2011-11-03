class Investigation < ActiveRecord::Base
	belongs_to :consultation
	belongs_to :assay
end
