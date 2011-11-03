require 'spec_helper'

describe "referrals/new.html.erb" do
  before(:each) do
    assign(:referral, stub_model(Referral,
      :referred => "MyString",
      :centre_name => "MyString",
      :consultant_name => "MyString"
    ).as_new_record)
  end

  it "renders new referral form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => referrals_path, :method => "post" do
      assert_select "input#referral_referred", :name => "referral[referred]"
      assert_select "input#referral_centre_name", :name => "referral[centre_name]"
      assert_select "input#referral_consultant_name", :name => "referral[consultant_name]"
    end
  end
end
