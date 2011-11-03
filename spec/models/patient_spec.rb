require 'spec_helper'
require 'patient'

describe Patient, "#create" do
	it "shows patient can be created" do
		this_patient = Patient.new
		assert this_patient.valid?
	end
end
