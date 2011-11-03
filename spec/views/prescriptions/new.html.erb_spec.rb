require 'spec_helper'

describe "prescriptions/new.html.erb" do
  before(:each) do
    assign(:prescription, stub_model(Prescription).as_new_record)
  end

  it "renders new prescription form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => prescriptions_path, :method => "post" do
    end
  end
end
