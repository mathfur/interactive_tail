require "spec_helper"

describe LogFilesController do
  describe "routing" do

    it "routes to #index" do
      get("/log_files").should route_to("log_files#index")
    end

    it "routes to #new" do
      get("/log_files/new").should route_to("log_files#new")
    end

    it "routes to #show" do
      get("/log_files/1").should route_to("log_files#show", :id => "1")
    end

    it "routes to #edit" do
      get("/log_files/1/edit").should route_to("log_files#edit", :id => "1")
    end

    it "routes to #create" do
      post("/log_files").should route_to("log_files#create")
    end

    it "routes to #update" do
      put("/log_files/1").should route_to("log_files#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/log_files/1").should route_to("log_files#destroy", :id => "1")
    end

  end
end
