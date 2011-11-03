require 'spec_helper'

describe "referrals/index.html.erb" do
  before(:each) do
    assign(:referrals, [
      stub_model(Referral,
        :referred => "Referred",
        :centre_name => "Centre Name",
        :consultant_name => "Consultant Name"
      ),
      stub_model(Referral,
        :referred => "Referred",
        :centre_name => "Centre Name",
        :consultant_name => "Consultant Name"
      )
    ])
  end

  it "renders a list of referrals" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Referred".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Centre Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Consultant Name".to_s, :count => 2
  end
end
