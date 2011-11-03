class Viewer < ActiveRecord::Base
	#1.1 Date of completion of questionnaire
	#1.2 Hospital name
	#1.3 Consultant responsible for patient
	#1.4 Telephone number
	#1.4 Email
	#1.5 Has the patient been referred to/from another centre
	#1.5 Date of original admission
	#1.5 Name centre
	#1.5 Name consultant
	#2.1 NHS Number
	#2.2 Hospital number
	#2.3 Date of admission
	#2.4 Date of discharge
	#2.5 Initials
	#2.5 Postcode
	#2.5 Town of birth
	#2.6 Sex
	#2.6 Date of birth
	#2.7 Ethnicity
	#2.7 Ethnicity other
	#3.1 Weight of patient at admission
	#3.2 Height of patient at admission
	#3.3 Did the patient travel outside of the UK in the two weeks prior to admission
	#3.3 Country region visited 1
	#3.3 Date arrived 1
	#3.3 Date departed 1
	#3.3 Country region visited 2
	#3.3 Date arrived 2
	#3.3 Date departed 2
	#3.3 Country region visited 3
	#3.3 Date arrived 3
	#3.3 Date departed 3
	#3.4 NSAIDS
	#3.4 Corticosteroids
	#3.4 Antidiarrhoeals
	#3.4 Antimotility agents
	#3.4 Antibiotics/antibacterials
	#3.4 Antihypertensives
	#3.5 Has the patient had HUS before?
	#3.6 Were there any pre-existing kidney diseases?
	#3.7 Were there any pre-existing urinary tract infection related problems?
	#3.8 Did anyone else in the SAME HOUSEHOLD have bloody diarrhoea in the TWO WEEKS prior to illness?
	#3.8 Name 1
	#3.8 Relationship 1
	#3.8 Date of onset/diagnosis 1
	#3.8 Name 2
	#3.8 Relationship 2
	#3.8 Date of onset/diagnosis 2
	#3.9 Has any other household member had HUS?
	#3.9 Name 1
	#3.9 Relationship 1
	#3.9 Date of onset/diagnosis 1
	#3.9 Name 2
	#3.9 Relationship 2
	#3.9 Date of onset/diagnosis 2
	attr_accessible :consulatation_consulted_date, :consultation_current_state, :consultation_traveled_recently
	attr_accessible :patient_id
	attr_accessible :medic_name, :medic_position, :medic_telephone, :medic_email
	attr_accessible :admission_date_admitted, :admission
end
