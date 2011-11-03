require 'spec_helper'

describe "referrals/show.html.erb" do
  before(:each) do
    @referral = assign(:referral, stub_model(Referral,
      :referred => "Referred",
      :centre_name => "Centre Name",
      :consultant_name => "Consultant Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Referred/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Centre Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Consultant Name/)
  end
end
