class Patient < ActiveRecord::Base
	#Constants for Patient
	AVAILABLE_STATES = ["active", "draft", "inactive"]
	AVAILABLE_GENDERS = ["MALE", "FEMALE"]
	AVAILABLE_MORTALITY_OPTIONS = ["LIVING", "DEAD", "UNKNOWN"]
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

	has_many :consultations
	belongs_to :user
	belongs_to :ethnicity

	
	attr_encrypted :nhs_number, :key => LOCK
	attr_encrypted :initials, :key => LOCK
	attr_encrypted :postcode, :key => LOCK
	attr_encrypted :town_of_birth, :key => LOCK
	attr_encrypted :sex, :key => LOCK
	attr_encrypted :year_of_birth, :key => LOCK
	attr_encrypted :mortality, :key => LOCK
	attr_encrypted :date_of_death, :key => LOCK
	attr_encrypted :cause_of_death, :key => LOCK
	attr_encrypted :ethnicity_other, :key => LOCK
	
	#Virtual attributes
	attr_accessor :nhs_number_1, :nhs_number_2, :nhs_number_3, :nhs_number_4, :nhs_number_5, :nhs_number_6, :nhs_number_7, :nhs_number_8, :nhs_number_9, :nhs_number_10
	attr_accessible  :nhs_number_1, :nhs_number_2, :nhs_number_3, :nhs_number_4, :nhs_number_5, :nhs_number_6, :nhs_number_7, :nhs_number_8, :nhs_number_9, :nhs_number_10
	
	
	#mass-assignment 
	attr_accessible :current_state, :nhs_number, :initials, :postcode, :town_of_birth, :sex, :year_of_birth, :mortality, :date_of_death, :cause_of_death, :dod_unknown, :ethnicity_other, :ethnicity_id, :user_id
	#before_validation :make_nhs_number
	
	#Virtual attribute validation
	#validates :nhs_number_1, :presence => true, :length => {:minimum => 1, :maximum => 1}, :numericality => true
	#validates :nhs_number_2, :presence => true, :length => {:minimum => 1, :maximum => 1}, :numericality => true
	#validates :nhs_number_3, :presence => true, :length => {:minimum => 1, :maximum => 1}, :numericality => true
	#validates :nhs_number_4, :presence => true, :length => {:minimum => 1, :maximum => 1}, :numericality => true
	#validates :nhs_number_5, :presence => true, :length => {:minimum => 1, :maximum => 1}, :numericality => true
	#validates :nhs_number_6, :presence => true, :length => {:minimum => 1, :maximum => 1}, :numericality => true
	#validates :nhs_number_7, :presence => true, :length => {:minimum => 1, :maximum => 1}, :numericality => true
	#validates :nhs_number_8, :presence => true, :length => {:minimum => 1, :maximum => 1}, :numericality => true
	#validates :nhs_number_9, :presence => true, :length => {:minimum => 1, :maximum => 1}, :numericality => true
	#validates :nhs_number_10, :presence => true, :length => {:minimum => 1, :maximum => 1}, :numericality => true
	
	validates :encrypted_nhs_number, :uniqueness => true
	validates :initials, :presence => true, :if => :no_nhs_number? 
	validates :sex, :presence => true, :if => :no_nhs_number?
	validates :year_of_birth, :presence => true, :if => :no_nhs_number?
	
	before_save :upcase_attributes
	before_save :make_nhs_number

	
	def make_nhs_number
		#Compact the ten virtual attributes into the Patient.nhs_number
		nhs_number = [self.nhs_number_1.to_s, self.nhs_number_2.to_s, self.nhs_number_3.to_s, self.nhs_number_4.to_s, self.nhs_number_5.to_s, self.nhs_number_6.to_s, self.nhs_number_7.to_s, self.nhs_number_8.to_s, self.nhs_number_9.to_s, self.nhs_number_10.to_s].join
		if nhs_number.length == 10
			self.nhs_number = nhs_number	
		end
	end
	
	def no_nhs_number?
		self.encrypted_nhs_number?	
	end
	
	def split_nhs_number
		#Split the NHS number for this patient into the 10 seperate virtual attributes, Patient.nhs_number_*
		#return true if no errors
		#return false otherwise
		this_number_array = self.nhs_number.split(//)
		begin
			self.nhs_number_1 = this_number_array[0]
			self.nhs_number_2 = this_number_array[1]
			self.nhs_number_3 = this_number_array[2]
			self.nhs_number_4 = this_number_array[3]
			self.nhs_number_5 = this_number_array[4]
			self.nhs_number_6 = this_number_array[5]
			self.nhs_number_7 = this_number_array[6]
			self.nhs_number_8 = this_number_array[7]
			self.nhs_number_9 = this_number_array[8]
			self.nhs_number_10 = this_number_array[9]
		
		rescue
	
		end
	end
	
	def upcase_attributes
		#strip whitespace and upcase text strings
		self.initials = self.initials ? self.initials.strip.upcase : nil
		self.postcode = self.postcode ? self.postcode.strip.upcase : nil
		self.town_of_birth = self.town_of_birth ? self.town_of_birth.strip.upcase : nil
		self.cause_of_death = self.cause_of_death ? self.cause_of_death.strip.upcase : nil
		self.ethnicity_other = self.ethnicity_other ? self.ethnicity_other.strip.upcase : nil
	end
	
	
	def check_identifiers
		#Patient.search()	
		
	end
	
	class << columns_hash['date_of_death']
	    def type
	      :date
	    end
	end
	
	class << columns_hash['encrypted_date_of_death']
	    def type
	      :date	
	    end
	end
end
