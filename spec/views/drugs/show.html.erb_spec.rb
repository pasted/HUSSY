require 'spec_helper'

describe "drugs/show.html.erb" do
  before(:each) do
    @drug = assign(:drug, stub_model(Drug))
  end

  it "renders attributes in <p>" do
    render
  end
end
