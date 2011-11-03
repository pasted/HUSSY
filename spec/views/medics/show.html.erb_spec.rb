require 'spec_helper'

describe "medics/show.html.erb" do
  before(:each) do
    @medic = assign(:medic, stub_model(Medic))
  end

  it "renders attributes in <p>" do
    render
  end
end
