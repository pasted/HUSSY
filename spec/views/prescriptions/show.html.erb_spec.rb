require 'spec_helper'

describe "prescriptions/show.html.erb" do
  before(:each) do
    @prescription = assign(:prescription, stub_model(Prescription))
  end

  it "renders attributes in <p>" do
    render
  end
end
