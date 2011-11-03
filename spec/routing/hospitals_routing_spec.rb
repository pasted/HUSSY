require "spec_helper"

describe HospitalsController do
  describe "routing" do

    it "routes to #index" do
      get("/hospitals").should route_to("hospitals#index")
    end

    it "routes to #new" do
      get("/hospitals/new").should route_to("hospitals#new")
    end

    it "routes to #show" do
      get("/hospitals/1").should route_to("hospitals#show", :id => "1")
    end

    it "routes to #edit" do
      get("/hospitals/1/edit").should route_to("hospitals#edit", :id => "1")
    end

    it "routes to #create" do
      post("/hospitals").should route_to("hospitals#create")
    end

    it "routes to #update" do
      put("/hospitals/1").should route_to("hospitals#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/hospitals/1").should route_to("hospitals#destroy", :id => "1")
    end

  end
end
