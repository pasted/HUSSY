require 'spec_helper'

describe "outcomes/show.html.erb" do
  before(:each) do
    @outcome = assign(:outcome, stub_model(Outcome))
  end

  it "renders attributes in <p>" do
    render
  end
end
