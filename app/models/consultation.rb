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
	
	
	accepts_nested_attributes_for :patient, :reject_if => :all_blank
	accepts_nested_attributes_for :medic, :reject_if => :all_blank, :allow_destroy => true
	
	accepts_nested_attributes_for :relationships, :reject_if => :all_blank, :allow_destroy => true
	accepts_nested_attributes_for :physicals,  :reject_if => :all_blank, :allow_destroy => true
	accepts_nested_attributes_for :prescriptions, :reject_if => :all_blank, :allow_destroy => true
	accepts_nested_attributes_for :investigations, :reject_if => :all_blank, :allow_destroy => true
	accepts_nested_attributes_for :admissions, :reject_if => :all_blank, :allow_destroy => true
	accepts_nested_attributes_for :conditions, :reject_if => :all_blank, :allow_destroy => true
	accepts_nested_attributes_for :treatments, :reject_if => :all_blank, :allow_destroy => true
	accepts_nested_attributes_for :outcomes, :reject_if => :all_blank, :allow_destroy => true
	accepts_nested_attributes_for :travels, :reject_if => :all_blank, :allow_destroy => true
	accepts_nested_attributes_for :referrals, :reject_if => :all_blank, :allow_destroy => true
	accepts_nested_attributes_for :specimens, :reject_if => :all_blank, :allow_destroy => true
	
	attr_accessible :consulted_date, :current_state, :traveled_recently, :notification, :notification_date, :notification_date_unknown
	attr_accessible :patient_id, :medic_id, :admission_id, :user_id, :hospital_tokens
	attr_accessible :medic_attributes, :admissions_attributes, :conditions_attributes, :investigations_attributes, :outcomes_attributes
	attr_accessible :physicals_attributes, :prescriptions_attributes, :referrals_attributes, :relationships_attributes
	attr_accessible :specimens_attributes, :travels_attributes, :treatments_attributes, :patient_attributes
	
	# hospital_tokens is used for tokeninput jquery plugin
	# not implemented at the moment due difficulties in associating related parameters to the hospital_id param
	attr_reader :hospital_tokens
	
	scope :with_historical_conditions, joins(:conditions) & Condition.historical
	scope :with_present_conditions, joins(:conditions) & Condition.present
	
	def hospital_tokens=(ids)
		self.hospital_ids = ids.split(",")	
	end
	
	
end
