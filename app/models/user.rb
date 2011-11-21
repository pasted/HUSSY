class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :confirmable, :recoverable, :lockable, :timeoutable, :trackable, :rememberable, :validatable, :registerable
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :position, :title, :telephone, :current_state, :role_id

  
  AVAILABLE_STATES = ["ACTIVE", "INACTIVE"]
		
  include AASM
	
	aasm_column :current_state
	aasm_initial_state :active
	 
	aasm_state :active
	aasm_state :inactive
	 
	aasm_event :activate do
		transitions :to => :active, :from => [:inactive]	
	end
	 
	aasm_event :inactivate do
		transitions :to => :inactive, :from => [:active]
	end
	
	
	has_many :assignments
	has_many :roles, :through => :assignments
	
	has_many :patients
	has_many :consultations
	
	accepts_nested_attributes_for :assignments
	
  before_save :lowercase_email
  before_destroy :check_patients
  before_destroy :check_consultations
	
  def role?(role)
  	  return !!self.roles.find_by_name(role.to_s.upcase)
  end
  
  def has_role?(role_sym)
  	  roles.any? { |r| r.name.underscore.to_sym == role_sym }
  end
  
  def lowercase_email
  	  self.email.downcase!	  
  end
  
  def full_name
  	  return self.first_name << " " << self.last_name  
  end
  
  private
    def check_patients
  	  if self.patients
  	  	  flash[:notice] = 'This user has patients assigned to them.'
  	  	  false
  	  end
    end
  
    def check_consultations
  	  if self.consultations
  	  	  flash[:notice] = "This user has consultations assigned to them"
  	  	  false
  	  end
    end
  
end
