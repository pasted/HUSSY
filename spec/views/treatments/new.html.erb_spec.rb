require 'spec_helper'

describe "treatments/new.html.erb" do
  before(:each) do
    assign(:treatment, stub_model(Treatment).as_new_record)
  end

  it "renders new treatment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => treatments_path, :method => "post" do
    end
  end
end
