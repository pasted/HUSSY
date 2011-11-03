require "spec_helper"

describe TherapiesController do
  describe "routing" do

    it "routes to #index" do
      get("/therapies").should route_to("therapies#index")
    end

    it "routes to #new" do
      get("/therapies/new").should route_to("therapies#new")
    end

    it "routes to #show" do
      get("/therapies/1").should route_to("therapies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/therapies/1/edit").should route_to("therapies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/therapies").should route_to("therapies#create")
    end

    it "routes to #update" do
      put("/therapies/1").should route_to("therapies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/therapies/1").should route_to("therapies#destroy", :id => "1")
    end

  end
end
