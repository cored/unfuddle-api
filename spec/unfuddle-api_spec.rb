require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "UnfuddleApi" do
  context "Authentication" do 
    it "should authenticate an user within the unfuddle servers" do 
      unfuddle = UnfuddleAPI.authenticate('username', 'password')
      unfuddle.should_not be_nil
    end
  end
end
