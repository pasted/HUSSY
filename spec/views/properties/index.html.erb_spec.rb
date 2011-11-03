require 'spec_helper'

describe "properties/index.html.erb" do
  before(:each) do
    assign(:properties, [
      stub_model(Property),
      stub_model(Property)
    ])
  end

  it "renders a list of properties" do
    render
  end
end
