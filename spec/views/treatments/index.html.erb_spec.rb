require 'spec_helper'

describe "treatments/index.html.erb" do
  before(:each) do
    assign(:treatments, [
      stub_model(Treatment),
      stub_model(Treatment)
    ])
  end

  it "renders a list of treatments" do
    render
  end
end
