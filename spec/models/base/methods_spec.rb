require File.dirname(__FILE__) + '/../../spec_helper.rb'

describe ActsAsApi::Base do

  describe "calling a method in the api template", :orm => :active_record do

    before(:each) do
      setup_models
      @response = @luke.as_api_response(:only_full_name)
    end

    after(:each) do
      clean_up
    end

    it "returns a hash" do
      @response.should be_kind_of(Hash)
    end

    it "returns the correct number of fields" do
      @response.should have(1).key
    end

    it "returns all specified fields by name" do
      @response.keys.should include(:full_name)
    end

    it "returns the correct values for the specified fields" do
      @response.values.should include(@luke.full_name)
    end

  end
end
