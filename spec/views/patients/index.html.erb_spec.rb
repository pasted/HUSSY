require 'spec_helper'

describe "patients/index.html.erb" do
  before(:each) do
    assign(:patients, [
      stub_model(Patient,
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
      ),
      stub_model(Patient,
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
      )
    ])
  end

  it "renders a list of patients" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Current State".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Encrypted Nhs Number".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Encrypted Initials".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Encrypted Postcode".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Encrypted Town Of Birth".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Encrypted Sex".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Encrypted Date Of Birth".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Encrypted Date Of Death".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Encrypted Cause Of Death".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Ethnicity Other".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
