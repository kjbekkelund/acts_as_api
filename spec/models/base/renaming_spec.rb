require File.dirname(__FILE__) + '/../../spec_helper.rb'

describe ActsAsApi::Base do

  describe "renaming", :orm => :active_record do

    before(:each) do
      setup_models
    end

    after(:each) do
      clean_up
    end

    describe "an attribute in the api template" do

      before(:each) do
        @response = @luke.as_api_response(:rename_last_name)
      end

      it "returns a hash" do
        @response.should be_kind_of(Hash)
      end

      it "returns the correct number of fields" do
        @response.should have(1).key
      end

      it "returns all specified fields" do
        @response.keys.should include(:family_name)
      end

      it "returns the correct values for the specified fields" do
        @response.values.should include(@luke.last_name)
      end

    end

    describe "the node/key of a method in the api template" do

      before(:each) do
        @response = @luke.as_api_response(:rename_full_name)
      end

      it "returns a hash" do
        @response.should be_kind_of(Hash)
      end

      it "returns the correct number of fields" do
        @response.should have(1).key
      end

      it "returns all specified fields" do
        @response.keys.should include(:other_full_name)
      end

      it "returns the correct values for the specified fields" do
        @response.values.should include(@luke.full_name)
      end

    end
  end
end
