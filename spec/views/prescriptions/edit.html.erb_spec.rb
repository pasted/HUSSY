require 'spec_helper'

describe "prescriptions/edit.html.erb" do
  before(:each) do
    @prescription = assign(:prescription, stub_model(Prescription))
  end

  it "renders the edit prescription form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => prescriptions_path(@prescription), :method => "post" do
    end
  end
end
