require 'spec_helper'

describe "outcomes/edit.html.erb" do
  before(:each) do
    @outcome = assign(:outcome, stub_model(Outcome))
  end

  it "renders the edit outcome form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => outcomes_path(@outcome), :method => "post" do
    end
  end
end
