require 'spec_helper'

describe "characteristics/index.html.erb" do
  before(:each) do
    assign(:characteristics, [
      stub_model(Characteristic),
      stub_model(Characteristic)
    ])
  end

  it "renders a list of characteristics" do
    render
  end
end
