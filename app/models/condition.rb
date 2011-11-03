class Condition < ActiveRecord::Base
	belongs_to :conditionable, :polymorphic => :true
	belongs_to :classification
end
