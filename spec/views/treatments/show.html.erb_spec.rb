require 'spec_helper'

describe "treatments/show.html.erb" do
  before(:each) do
    @treatment = assign(:treatment, stub_model(Treatment))
  end

  it "renders attributes in <p>" do
    render
  end
end
