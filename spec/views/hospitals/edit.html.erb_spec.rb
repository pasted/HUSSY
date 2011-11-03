require 'spec_helper'

describe "hospitals/edit.html.erb" do
  before(:each) do
    @hospital = assign(:hospital, stub_model(Hospital))
  end

  it "renders the edit hospital form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => hospitals_path(@hospital), :method => "post" do
    end
  end
end
