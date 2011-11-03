class Relationship < ActiveRecord::Base
	belongs_to :consultation
	belongs_to :contact
	
	accepts_nested_attributes_for :contact, :allow_destroy => true
end
