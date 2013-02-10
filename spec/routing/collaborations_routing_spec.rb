require "spec_helper"

describe CollaborationsController do
  describe "routing" do

    it "routes to #index" do
      get("/collaborations").should route_to("collaborations#index")
    end

    it "routes to #new" do
      get("/collaborations/new").should route_to("collaborations#new")
    end

    it "routes to #show" do
      get("/collaborations/1").should route_to("collaborations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/collaborations/1/edit").should route_to("collaborations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/collaborations").should route_to("collaborations#create")
    end

    it "routes to #update" do
      put("/collaborations/1").should route_to("collaborations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/collaborations/1").should route_to("collaborations#destroy", :id => "1")
    end

  end
end
