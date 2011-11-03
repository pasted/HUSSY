require 'spec_helper'

describe "referrals/edit.html.erb" do
  before(:each) do
    @referral = assign(:referral, stub_model(Referral,
      :referred => "MyString",
      :centre_name => "MyString",
      :consultant_name => "MyString"
    ))
  end

  it "renders the edit referral form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => referrals_path(@referral), :method => "post" do
      assert_select "input#referral_referred", :name => "referral[referred]"
      assert_select "input#referral_centre_name", :name => "referral[centre_name]"
      assert_select "input#referral_consultant_name", :name => "referral[consultant_name]"
    end
  end
end
