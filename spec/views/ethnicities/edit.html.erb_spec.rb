require 'spec_helper'

describe "ethnicities/edit.html.erb" do
  before(:each) do
    @ethnicity = assign(:ethnicity, stub_model(Ethnicity))
  end

  it "renders the edit ethnicity form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => ethnicities_path(@ethnicity), :method => "post" do
    end
  end
end
