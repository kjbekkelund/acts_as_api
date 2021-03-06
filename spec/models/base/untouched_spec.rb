require File.dirname(__FILE__) + '/../../spec_helper.rb'

describe ActsAsApi::Base do

  describe Untouched, :orm => :active_record do

    describe "has disabled acts_as_api by default" do
      it "indicates that acts_as_api is disabled" do
        Untouched.acts_as_api?.should be_false
      end

      it "does not respond to api_accessible" do
        Untouched.should_not respond_to :api_accessible
      end
    end

  end
end
