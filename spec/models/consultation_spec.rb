require 'spec_helper'
require 'consultation'

describe Consultation, "#create" do
	it "shows consultation can be created" do
		this_consultation = Consultation.new
		assert this_consultation.valid?
	end
end

describe Consultation, "#create_all" do
	it "shows consultation can be created with associated models" do
		this_consultation = Consultation.new
		this_consultation.build_patient
		this_consultation.outcomes.build
		this_consultation.treatments.build
		this_consultation.admissions.build.build_hospital
		this_consultation.physicals.build.build_characteristic
		this_consultation.prescriptions.build.build_drug
		this_consultation.investigations.build.build_assay
		this_consultation.conditions.build.build_classification
		assert this_consultation.valid?
	end
end
