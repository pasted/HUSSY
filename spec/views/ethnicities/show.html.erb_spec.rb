require 'spec_helper'

describe "ethnicities/show.html.erb" do
  before(:each) do
    @ethnicity = assign(:ethnicity, stub_model(Ethnicity))
  end

  it "renders attributes in <p>" do
    render
  end
end
