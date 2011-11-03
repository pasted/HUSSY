require 'spec_helper'

describe "hospitals/index.html.erb" do
  before(:each) do
    assign(:hospitals, [
      stub_model(Hospital),
      stub_model(Hospital)
    ])
  end

  it "renders a list of hospitals" do
    render
  end
end
