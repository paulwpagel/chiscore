require "spec_helper"

describe CheckpointsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/checkpoints" }.should route_to(:controller => "checkpoints", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/checkpoints/new" }.should route_to(:controller => "checkpoints", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/checkpoints/1" }.should route_to(:controller => "checkpoints", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/checkpoints/1/edit" }.should route_to(:controller => "checkpoints", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/checkpoints" }.should route_to(:controller => "checkpoints", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/checkpoints/1" }.should route_to(:controller => "checkpoints", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/checkpoints/1" }.should route_to(:controller => "checkpoints", :action => "destroy", :id => "1")
    end

  end
end
