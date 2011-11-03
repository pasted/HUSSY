require 'spec_helper'

describe "outcomes/index.html.erb" do
  before(:each) do
    assign(:outcomes, [
      stub_model(Outcome),
      stub_model(Outcome)
    ])
  end

  it "renders a list of outcomes" do
    render
  end
end
