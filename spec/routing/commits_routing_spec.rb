require "rails_helper"

module Api::V1
RSpec.describe CommitsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/commits").to route_to("commits#index")
    end


    it "routes to #show" do
      expect(:get => "/commits/1").to route_to("commits#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/commits").to route_to("commits#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/commits/1").to route_to("commits#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/commits/1").to route_to("commits#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/commits/1").to route_to("commits#destroy", :id => "1")
    end

  end
end
end
