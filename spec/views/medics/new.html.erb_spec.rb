require 'spec_helper'

describe "medics/new.html.erb" do
  before(:each) do
    assign(:medic, stub_model(Medic).as_new_record)
  end

  it "renders new medic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => medics_path, :method => "post" do
    end
  end
end
