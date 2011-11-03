require 'spec_helper'

describe "medics/index.html.erb" do
  before(:each) do
    assign(:medics, [
      stub_model(Medic),
      stub_model(Medic)
    ])
  end

  it "renders a list of medics" do
    render
  end
end
