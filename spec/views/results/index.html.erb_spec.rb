require 'spec_helper'

describe "results/index.html.erb" do
  before(:each) do
    assign(:results, [
      stub_model(Result,
        :name => "Name",
        :category => "Category"
      ),
      stub_model(Result,
        :name => "Name",
        :category => "Category"
      )
    ])
  end

  it "renders a list of results" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Category".to_s, :count => 2
  end
end
