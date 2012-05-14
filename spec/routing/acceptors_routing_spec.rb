require "spec_helper"

describe AcceptorsController do
  describe "routing" do

    it "routes to #index" do
      get("/acceptors").should route_to("acceptors#index")
    end

    it "routes to #new" do
      get("/acceptors/new").should route_to("acceptors#new")
    end

    it "routes to #show" do
      get("/acceptors/1").should route_to("acceptors#show", :id => "1")
    end

    it "routes to #edit" do
      get("/acceptors/1/edit").should route_to("acceptors#edit", :id => "1")
    end

    it "routes to #create" do
      post("/acceptors").should route_to("acceptors#create")
    end

    it "routes to #update" do
      put("/acceptors/1").should route_to("acceptors#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/acceptors/1").should route_to("acceptors#destroy", :id => "1")
    end

  end
end
