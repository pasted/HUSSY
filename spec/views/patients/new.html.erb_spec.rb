require 'spec_helper'

describe "patients/new.html.erb" do
  before(:each) do
    assign(:patient, stub_model(Patient,
      :current_state => "MyString",
      :encrypted_nhs_number => "MyString",
      :encrypted_initials => "MyString",
      :encrypted_postcode => "MyString",
      :encrypted_town_of_birth => "MyString",
      :encrypted_sex => "MyString",
      :encrypted_date_of_birth => "MyString",
      :encrypted_date_of_death => "MyString",
      :encrypted_cause_of_death => "MyString",
      :dod_unknown => false,
      :ethnicity_id => 1,
      :ethnicity_other => "MyString",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new patient form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => patients_path, :method => "post" do
      assert_select "input#patient_current_state", :name => "patient[current_state]"
      assert_select "input#patient_encrypted_nhs_number", :name => "patient[encrypted_nhs_number]"
      assert_select "input#patient_encrypted_initials", :name => "patient[encrypted_initials]"
      assert_select "input#patient_encrypted_postcode", :name => "patient[encrypted_postcode]"
      assert_select "input#patient_encrypted_town_of_birth", :name => "patient[encrypted_town_of_birth]"
      assert_select "input#patient_encrypted_sex", :name => "patient[encrypted_sex]"
      assert_select "input#patient_encrypted_date_of_birth", :name => "patient[encrypted_date_of_birth]"
      assert_select "input#patient_encrypted_date_of_death", :name => "patient[encrypted_date_of_death]"
      assert_select "input#patient_encrypted_cause_of_death", :name => "patient[encrypted_cause_of_death]"
      assert_select "input#patient_dod_unknown", :name => "patient[dod_unknown]"
      assert_select "input#patient_ethnicity_id", :name => "patient[ethnicity_id]"
      assert_select "input#patient_ethnicity_other", :name => "patient[ethnicity_other]"
      assert_select "input#patient_user_id", :name => "patient[user_id]"
    end
  end
end
