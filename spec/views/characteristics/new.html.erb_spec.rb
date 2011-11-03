require 'spec_helper'

describe "characteristics/new.html.erb" do
  before(:each) do
    assign(:characteristic, stub_model(Characteristic).as_new_record)
  end

  it "renders new characteristic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => characteristics_path, :method => "post" do
    end
  end
end
