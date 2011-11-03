require "spec_helper"

describe OutcomesController do
  describe "routing" do

    it "routes to #index" do
      get("/outcomes").should route_to("outcomes#index")
    end

    it "routes to #new" do
      get("/outcomes/new").should route_to("outcomes#new")
    end

    it "routes to #show" do
      get("/outcomes/1").should route_to("outcomes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/outcomes/1/edit").should route_to("outcomes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/outcomes").should route_to("outcomes#create")
    end

    it "routes to #update" do
      put("/outcomes/1").should route_to("outcomes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/outcomes/1").should route_to("outcomes#destroy", :id => "1")
    end

  end
end
