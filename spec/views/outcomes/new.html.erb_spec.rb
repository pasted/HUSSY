require 'spec_helper'

describe "outcomes/new.html.erb" do
  before(:each) do
    assign(:outcome, stub_model(Outcome).as_new_record)
  end

  it "renders new outcome form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => outcomes_path, :method => "post" do
    end
  end
end
