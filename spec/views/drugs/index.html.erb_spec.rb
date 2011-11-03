require 'spec_helper'

describe "drugs/index.html.erb" do
  before(:each) do
    assign(:drugs, [
      stub_model(Drug),
      stub_model(Drug)
    ])
  end

  it "renders a list of drugs" do
    render
  end
end
