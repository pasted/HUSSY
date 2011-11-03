FactoryGirl.define do
	factory :patient do
		current_state 'ACTIVE'
		nhs_number '1001 1001 100'
		initials 'JD'
		postcode 'NW9'
		town_of_birth 'LONDON'
		sex 'MALE'
		date_of_birth '01-01-1990'
		cause_of_death 'ITISIS'
		dod_unknown 'FALSE'
		ethnicity_id '1'
		ethnicity_other ''
		user_id '1'
		
	end
  
end
