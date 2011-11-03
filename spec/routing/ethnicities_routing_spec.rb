require "spec_helper"

describe EthnicitiesController do
  describe "routing" do

    it "routes to #index" do
      get("/ethnicities").should route_to("ethnicities#index")
    end

    it "routes to #new" do
      get("/ethnicities/new").should route_to("ethnicities#new")
    end

    it "routes to #show" do
      get("/ethnicities/1").should route_to("ethnicities#show", :id => "1")
    end

    it "routes to #edit" do
      get("/ethnicities/1/edit").should route_to("ethnicities#edit", :id => "1")
    end

    it "routes to #create" do
      post("/ethnicities").should route_to("ethnicities#create")
    end

    it "routes to #update" do
      put("/ethnicities/1").should route_to("ethnicities#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/ethnicities/1").should route_to("ethnicities#destroy", :id => "1")
    end

  end
end
