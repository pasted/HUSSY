require 'spec_helper'

describe "therapies/index.html.erb" do
  before(:each) do
    assign(:therapies, [
      stub_model(Therapy,
        :name => "Name"
      ),
      stub_model(Therapy,
        :name => "Name"
      )
    ])
  end

  it "renders a list of therapies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
