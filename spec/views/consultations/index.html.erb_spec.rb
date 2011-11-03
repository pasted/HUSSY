require 'spec_helper'

describe "consultations/index.html.erb" do
  before(:each) do
    assign(:consultations, [
      stub_model(Consultation),
      stub_model(Consultation)
    ])
  end

  it "renders a list of consultations" do
    render
  end
end
