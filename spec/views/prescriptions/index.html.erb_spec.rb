require 'spec_helper'

describe "prescriptions/index.html.erb" do
  before(:each) do
    assign(:prescriptions, [
      stub_model(Prescription),
      stub_model(Prescription)
    ])
  end

  it "renders a list of prescriptions" do
    render
  end
end
