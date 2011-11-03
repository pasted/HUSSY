class Consultation < ActiveRecord::Base
	AVAILABLE_STATES = ["ACTIVE", "DRAFT", "INACTIVE"]
	include AASM
	
	aasm_column :current_state
	aasm_initial_state :draft
	 
	aasm_state :draft
	aasm_state :active
	aasm_state :inactive
	 
	aasm_event :activate do
		transitions :to => :active, :from => [:draft]	
	end
	 
	aasm_event :inactivate do
		transitions :to => :inactive, :from => [:active, :draft]
	end
	 
	aasm_event :draft do
		transitions :to => :draft, :from => [:active, :inactive]
	end
	
	belongs_to :patient
	belongs_to :medic
	belongs_to :user
	
	has_many :travels
	has_many :referrals
	has_many :specimens
	
        has_many :outcomes, :dependent => :destroy
        has_many :results, :through => :outcomes

	has_many :treatments, :dependent => :destroy
	has_many :therapies, :through => :treatments
	
	has_many :admissions, :dependent => :destroy
	has_many :hospitals, :through => :admissions
	
	has_many :physicals, :dependent => :destroy
	has_many :characteristics, :through => :physicals
	
	has_many :prescriptions, :dependent => :destroy
	has_many :drugs, :through => :prescriptions
	
	has_many :investigations, :dependent => :destroy
	has_many :assays, :through => :investigations
	
	has_many :conditions, :as => :conditionable, :dependent => :destroy
	has_many :classifications, :through => :conditions
	
	has_many :relationships
	has_many :contacts, :through => :relationships
	
	
	accepts_nested_attributes_for :patient
	accepts_nested_attributes_for :medic
	
	accepts_nested_attributes_for :relationships, :allow_destroy => true
	accepts_nested_attributes_for :physicals, :allow_destroy => true
	accepts_nested_attributes_for :prescriptions, :allow_destroy => true
	accepts_nested_attributes_for :investigations, :allow_destroy => true
	accepts_nested_attributes_for :admissions, :allow_destroy => true
	accepts_nested_attributes_for :conditions, :allow_destroy => true
	accepts_nested_attributes_for :treatments, :allow_destroy => true
	accepts_nested_attributes_for :outcomes, :allow_destroy => true
	accepts_nested_attributes_for :travels, :allow_destroy => true
	accepts_nested_attributes_for :referrals, :allow_destroy => true
	accepts_nested_attributes_for :specimens, :allow_destroy => true
	
	
end
