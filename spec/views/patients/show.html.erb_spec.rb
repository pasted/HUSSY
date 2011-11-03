require 'spec_helper'

describe "patients/show.html.erb" do
  before(:each) do
    @patient = assign(:patient, stub_model(Patient,
      :current_state => "Current State",
      :encrypted_nhs_number => "Encrypted Nhs Number",
      :encrypted_initials => "Encrypted Initials",
      :encrypted_postcode => "Encrypted Postcode",
      :encrypted_town_of_birth => "Encrypted Town Of Birth",
      :encrypted_sex => "Encrypted Sex",
      :encrypted_date_of_birth => "Encrypted Date Of Birth",
      :encrypted_date_of_death => "Encrypted Date Of Death",
      :encrypted_cause_of_death => "Encrypted Cause Of Death",
      :dod_unknown => false,
      :ethnicity_id => 1,
      :ethnicity_other => "Ethnicity Other",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Current State/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Encrypted Nhs Number/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Encrypted Initials/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Encrypted Postcode/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Encrypted Town Of Birth/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Encrypted Sex/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Encrypted Date Of Birth/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Encrypted Date Of Death/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Encrypted Cause Of Death/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Ethnicity Other/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
