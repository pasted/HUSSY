require 'spec_helper'

describe "treatments/edit.html.erb" do
  before(:each) do
    @treatment = assign(:treatment, stub_model(Treatment))
  end

  it "renders the edit treatment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => treatments_path(@treatment), :method => "post" do
    end
  end
end
