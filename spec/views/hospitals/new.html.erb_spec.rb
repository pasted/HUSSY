require 'spec_helper'

describe "hospitals/new.html.erb" do
  before(:each) do
    assign(:hospital, stub_model(Hospital).as_new_record)
  end

  it "renders new hospital form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => hospitals_path, :method => "post" do
    end
  end
end
