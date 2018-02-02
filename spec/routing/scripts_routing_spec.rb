require "rails_helper"

module Api::V1
RSpec.describe ScriptsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/scripts").to route_to("scripts#index")
    end


    it "routes to #show" do
      expect(:get => "/scripts/1").to route_to("scripts#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/scripts").to route_to("scripts#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/scripts/1").to route_to("scripts#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/scripts/1").to route_to("scripts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/scripts/1").to route_to("scripts#destroy", :id => "1")
    end

  end
end
end
