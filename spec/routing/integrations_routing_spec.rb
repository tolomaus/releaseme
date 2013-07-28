require "spec_helper"

describe IntegrationsController do
  describe "routing" do

    it "routes to #index" do
      get("/integrations").should route_to("integrations#index")
    end

    it "routes to #new" do
      get("/integrations/new").should route_to("integrations#new")
    end

    it "routes to #show" do
      get("/integrations/1").should route_to("integrations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/integrations/1/edit").should route_to("integrations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/integrations").should route_to("integrations#create")
    end

    it "routes to #update" do
      put("/integrations/1").should route_to("integrations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/integrations/1").should route_to("integrations#destroy", :id => "1")
    end

  end
end
