require 'spec_helper'

describe "medics/edit.html.erb" do
  before(:each) do
    @medic = assign(:medic, stub_model(Medic))
  end

  it "renders the edit medic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => medics_path(@medic), :method => "post" do
    end
  end
end
