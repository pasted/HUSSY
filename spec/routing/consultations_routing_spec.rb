require "spec_helper"

describe ConsultationsController do
  describe "routing" do

    it "routes to #index" do
      get("/consultations").should route_to("consultations#index")
    end

    it "routes to #new" do
      get("/consultations/new").should route_to("consultations#new")
    end

    it "routes to #show" do
      get("/consultations/1").should route_to("consultations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/consultations/1/edit").should route_to("consultations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/consultations").should route_to("consultations#create")
    end

    it "routes to #update" do
      put("/consultations/1").should route_to("consultations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/consultations/1").should route_to("consultations#destroy", :id => "1")
    end

  end
end
