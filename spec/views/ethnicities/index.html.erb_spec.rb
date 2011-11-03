require 'spec_helper'

describe "ethnicities/index.html.erb" do
  before(:each) do
    assign(:ethnicities, [
      stub_model(Ethnicity),
      stub_model(Ethnicity)
    ])
  end

  it "renders a list of ethnicities" do
    render
  end
end
